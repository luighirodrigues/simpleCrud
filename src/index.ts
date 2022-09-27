import express from 'express'

import { Router, Request, Response } from 'express'

const app = express();

const route = Router();

route.get('/', (req: Request, res: Response) => {
    res.json({message : "Hello World!"})
})


app.use(route);

app.listen(3333, () => 'running on 3333');