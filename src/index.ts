import { PrismaClient } from '@prisma/client'
import express, { Router, Request, Response } from 'express'

import rotaLoja from './rotas/loja/rotaLoja'

const app = express()

app.use(express.json())

app.use('/loja', rotaLoja)

app.listen(3333, () => 'running on 3333')