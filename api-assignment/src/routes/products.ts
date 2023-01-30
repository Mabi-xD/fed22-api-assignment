import express from 'express'
import { index, show, store } from '../controllers/product_controller'
const router = express.Router()

/**
 * GET /products
 */
router.get('/', index)

/**
 * GET /products/:productsId
 */
router.get('/:productsId', show)

/**
 * POST /products
 */
router.post('/', store)

export default router