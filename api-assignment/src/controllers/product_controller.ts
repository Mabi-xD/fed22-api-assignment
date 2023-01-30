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
 * Get all products
 */
export const index = async (req: Request, res: Response) => {
    try {
        const products = await prisma.product.findMany({
        })
        res.send({
            status: "success",
            data: products
        })
    } catch (err) {
        debug("Error thrown when finding books", err)
		res.status(500).send({ status: "error", message: "Something went wrong" })
    }
}

/**
 * Get a single product
 */
export const show = async (req: Request, res: Response) => {
    const { productId } = req.params
    try {
        const product = await prisma.product.findUniqueOrThrow({
        where: {
            id: Number(productId)
        }
        })
        res.send({
            status: "success",
            data: product,
        })
    } catch(err){
        debug("Thrown error cause you fucked up, it's probably something related to %o %o.", req.params, err)
        res.status(500).send({ status: "error", message: "Something is fucking wrong"})
    }
}

/**
 * Create a product
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
        const { name, description, price, images, stock_status, stock_quantity, on_sale } = req.body
        const product = await prisma.product.create({
            data: {
                name,
                description,
                price,
                images,
                stock_status,
                stock_quantity,
                on_sale
            }
        })
        res.send({
            status: "success",
            data: product,
        })
    } catch(err){
            debug("Error thrown when creating a product %o: %o", req.body, err)
            res.status(500).send({ status: "error", message: "Something went wrong" })
        }
}


