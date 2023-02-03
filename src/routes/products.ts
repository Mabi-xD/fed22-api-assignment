import express from 'express'
import { body } from 'express-validator'
import { index, show, store } from '../controllers/product_controller'
const router = express.Router()

/**
 * GET /products
 */
router.get('/', index)

/**
 * GET /products/:productsId
 */
router.get('/:productId', show)

/**
 * POST /products
 */
router.post('/', [
    body('name').isString().withMessage('has to be a string'),
    body('description').isString().withMessage('has to be a string'),
    body('price').isInt({min: 1}).withMessage('has to be a number and greater than 0'),
    body('images').isObject().withMessage('has to be an object'),
    body('stock_status').isString().withMessage('has to be a string'),
    body('stock_quantity').isInt({min: 0}).withMessage('has to be an number and greater than 0'),
    body('on_sale').optional().isBoolean().withMessage('has to be a boolean')
], store)

export default router