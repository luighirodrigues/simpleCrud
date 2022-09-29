import { PrismaClient } from '@prisma/client'

import { Router, Request, Response } from 'express'

const rotaLoja = Router()

const prisma = new PrismaClient()

interface Loja {
    rua: string,
    numero: number
}

rotaLoja.get('/', async(req: Request, res: Response) => {
    const carregarLojas = await prisma.loja.findMany()
    res.json({
        data: carregarLojas
    })
})

rotaLoja.get('/:id', async(req: Request, res: Response) => {
    const {id} = req.params
    const carregarLojas = await prisma.loja.findFirst({
        where: {
            id: parseInt(id)
        }
    })
    res.json({
        data: carregarLojas
    })
})

rotaLoja.post('/', async(req: Request, res: Response) => {
    if(!req.body)return
    const formData : Loja = req.body
    if(!formData.numero || !formData.numero)return
    const data = await prisma.loja.create({
        data:{
            rua: formData.rua,
            numero: formData.numero,
        }
    })
    res.json({
        data
    })
})

rotaLoja.delete('/delete/:id', async(req: Request, res: Response) => {
    if(!req.params)return
    const {id} = req.params;
    const data = await prisma.loja.delete({where: {id: parseInt(id)}})
    res.json({
        data
    })
})

rotaLoja.put('/atualiza/:id', async(req: Request, res: Response) => {
    if(!req.params)return
    if(!req.body)return
    const {id} = req.params;
    const formData : Loja = req.body;
    const carregaLoja = await prisma.loja.findFirst({where: {id: parseInt(id)}})
    if(!carregaLoja) return
    const data = await prisma.loja.update({
        where: {id: carregaLoja.id},
        data: {
            rua: formData.rua,
            numero: formData.numero
        }
    })
    res.json({
        data
    })
})


export default rotaLoja