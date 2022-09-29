/*
  Warnings:

  - Added the required column `celular` to the `Cliente` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "Produto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "valor" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Venda" (
    "produtoId" INTEGER NOT NULL,
    "clienteId" INTEGER NOT NULL,
    "data_venda" DATETIME NOT NULL,
    "desconto" TEXT NOT NULL DEFAULT '0',
    "parcelas" INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY ("produtoId", "clienteId"),
    CONSTRAINT "Venda_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "Produto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Venda_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "Cliente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Cliente" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "celular" TEXT NOT NULL,
    "lojaId" INTEGER NOT NULL,
    CONSTRAINT "Cliente_lojaId_fkey" FOREIGN KEY ("lojaId") REFERENCES "Loja" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Cliente" ("email", "id", "lojaId", "nome") SELECT "email", "id", "lojaId", "nome" FROM "Cliente";
DROP TABLE "Cliente";
ALTER TABLE "new_Cliente" RENAME TO "Cliente";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
