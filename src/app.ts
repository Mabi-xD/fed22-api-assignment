import cors from "cors"
import express from "express"
import morgan from "morgan"
import routes from './routes'

const app = express()
app.use(cors())
app.use(express.json())
app.use(morgan('dev'))

// Use routes
app.use(routes)
console.log('Hej')
export default app
