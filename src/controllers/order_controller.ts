/**
 * Controller Template
 */
import Debug from 'debug'
import { Request, Response } from 'express'
import { validationResult } from 'express-validator'
import prisma from '../prisma'

// Create a new debug instance
const debug = Debug('api-assignment:order_controller')

/**
 * Get all orders
 */
export const index = async (req: Request, res: Response) => {
    try {
        const orders = await prisma.order.findMany({
            include:{
                order_items: true   
            }  
        })
        res.send({
            status: "success",
            data: orders
        })
    } catch (err) {
        debug("Error thrown when finding orders on o%", err)
		res.status(500).send({ status: "error", message: "Something went wrong" })
    }
}

/**
 * Get a single order
 */
export const show = async (req: Request, res: Response) => {
    const { orderId } = req.params
    try {
        const order = await prisma.order.findUniqueOrThrow({
        where: {
            id: Number(orderId)
        }, include: {
            order_items: true,
        }
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
 * Create a order
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
        const { order_items, customer_first_name, customer_last_name, customer_address, customer_postcode, customer_city, customer_email, customer_phone, order_total } = req.body
        const order = await prisma.order.create({
            data: {
                customer_first_name,
                customer_last_name,
                customer_address,  
                customer_postcode,
                customer_city,      
                customer_email,                
                customer_phone,    
                order_total,
                order_items: {
                    create: order_items
    },
},
include: {
    order_items: true,
}
})
        res.send({
            status: "success",
            data: order,
        })
    } catch(err){
            debug("Error thrown when creating a order %o", err)
            console.log(err)
            res.status(500).send({ status: "error", message: "Something went wrong" })
        }
}


