from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from typing import Optional

app = FastAPI()

# In-memory storage for orders
orders = {}

# Pydantic model for order data with detailed constraints
class Order(BaseModel):
    item_name: str = Field(
        ...,
        title="Item Name",
        max_length=100,
        regex=r'^[a-zA-Z0-9\s]+$',
        description="Name of the item, only alphanumeric characters and spaces are allowed."
    )
    quantity: int = Field(
        ...,
        title="Quantity",
        ge=1,
        le=1000,
        description="Quantity of the item, must be between 1 and 1000."
    )
    price: float = Field(
        ...,
        title="Price",
        gt=0.0,
        description="Price of the item, must be greater than 0."
    )
    description: Optional[str] = Field(
        None,
        title="Description",
        max_length=300,
        description="Optional description of the item, up to 300 characters."
    )

@app.get("/orderManagement/{id}")
async def get_order(id: int):
    if id in orders:
        return orders[id]
    else:
        raise HTTPException(status_code=404, detail="Order not found")

@app.post("/orderManagement")
async def create_order(order: Order):
    order_id = len(orders) + 1
    orders[order_id] = order
    return {"id": order_id, "order": order}