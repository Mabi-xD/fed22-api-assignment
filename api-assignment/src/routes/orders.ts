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
router.post('/', [], store)

// /**
//  * PATCH /order/:orderId
//  */
// router.patch('/:orderId', [], update)

// /**
//  * DELETE /order/:orderId
//  */
// router.delete('/:orderId', destroy)

export default router
