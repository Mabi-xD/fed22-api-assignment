/**
 * Router Template
 */
import express from 'express'
import { body } from 'express-validator'
import { index, store } from '../controllers/order_items_controller'
const router = express.Router()

/**
 * GET /order_items
 */
router.get('/', index)

/**
 * GET /order_items/:order_itemId
 */
//router.get('/:order_itemsId', show)

/**
 * POST /order_items
 */
router.post('/', [], store)

// /**
//  * PATCH /order_items/:order_itemsId
//  */
// router.patch('/:order_itemsId', [], update)

// /**
//  * DELETE /order_items/:order_itemsId
//  */
// router.delete('/:order_itemsId', destroy)

export default router
