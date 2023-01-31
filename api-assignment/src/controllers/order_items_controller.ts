/**
 * Controller Template
 */
import Debug from 'debug'
import { Request, Response } from 'express'
import { validationResult } from 'express-validator'
import prisma from '../prisma'

// Create a new debug instance
const debug = Debug('prisma-boilerplate:I_AM_LAZY_AND_HAVE_NOT_CHANGED_THIS_😛')

/**
 * Get all orders_items
 */
export const index = async (req: Request, res: Response) => {
    try {
        const orders = await prisma.orderItem.findMany({
        })
        res.send({
            status: "success",
            data: orders
        })
    } catch (err) {
        debug("Error thrown when finding orders", err)
		res.status(500).send({ status: "error", message: "Something went wrong" })
    }
}

/**
 * Get a single order
 */
export const show = async (req: Request, res: Response) => {
    const { orderId } = req.params
    try {
        const order = await prisma.orderItem.findUniqueOrThrow({
        where: {
            id: Number(orderId)
        },
        })
        res.send({
            status: "success",
            data: order,
        })
    } catch(err){
        debug("Thrown error cause you fucked up, it's probably something related to %o %o.", req.params, err)
        res.status(500).send({ status: "error", message: "Something is fucking wrong"})
    }
}

/**
 * Create order_items
 */
export const store = async (req: Request, res: Response) => {
    const validationErrors = validationResult(req)
    if (!validationErrors.isEmpty()) {
		return res.status(400).send({
			status: "fail",
			data: validationErrors.array(),
		})
	}
    try{
        const { productId, qty, item_price, item_total, orderId } = req.body
        const order_items = await prisma.orderItem.create({
            data: {
                productId,
                qty,
                item_price,
                item_total,
                orderId
            }
        })
        res.send({
            status: "success",
            data: order_items,
        })
    } catch(err){
            debug("Error thrown when creating a order %o: %o", req.body, err)
            res.status(500).send({ status: "error", message: "Something went wrong" })
        }
}


