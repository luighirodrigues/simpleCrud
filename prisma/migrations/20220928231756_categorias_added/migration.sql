/*
  Warnings:

  - You are about to drop the column `tipo` on the `Produto` table. All the data in the column will be lost.
  - Added the required column `tipoId` to the `Produto` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "Categoria" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Produto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "tipoId" INTEGER NOT NULL,
    "valor" TEXT NOT NULL,
    CONSTRAINT "Produto_tipoId_fkey" FOREIGN KEY ("tipoId") REFERENCES "Categoria" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Produto" ("id", "nome", "valor") SELECT "id", "nome", "valor" FROM "Produto";
DROP TABLE "Produto";
ALTER TABLE "new_Produto" RENAME TO "Produto";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
