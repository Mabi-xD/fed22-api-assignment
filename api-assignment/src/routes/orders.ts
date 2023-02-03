/**
 * Router Template
 */
import express from 'express'
import { body } from 'express-validator'
import { index, show, store } from '../controllers/order_controller'
const router = express.Router()

/**
 * GET /order
 */
router.get('/', index)

/**
 * GET /order/:orderId
 */
router.get('/:orderId', show)

/**
 * POST /order
 */
router.post('/', [
    body('customer_first_name').isString().withMessage('This gotta be a string'),
    body('customer_last_name').isString().withMessage('This gotta be a string'),
    body('customer_address').isString().withMessage('This gotta be a string'),
    body('customer_postcode').isString().isLength({max:6}).withMessage('Gotta be a string and cant be longer than 6 chars.'),
    body('customer_city').isString().withMessage('This gotta be a string'),
    body('customer_email').isString().isEmail().withMessage('This gotta be a string'),
    body('customer_phone').isString().isLength({max:20}).withMessage('This gotta be a string and cant be longer than 20 chars.'),
    body('order_total').isInt().withMessage('This gotta be a number.')
], store)

// /**
//  * PATCH /order/:orderId
//  */
// router.patch('/:orderId', [], update)

// /**
//  * DELETE /order/:orderId
//  */
// router.delete('/:orderId', destroy)

export default router
