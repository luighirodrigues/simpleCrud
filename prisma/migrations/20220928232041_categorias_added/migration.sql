-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Venda" (
    "produtoId" INTEGER NOT NULL,
    "clienteId" INTEGER NOT NULL,
    "data_venda" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "desconto" TEXT NOT NULL DEFAULT '0',
    "parcelas" INTEGER NOT NULL DEFAULT 1,

    PRIMARY KEY ("produtoId", "clienteId"),
    CONSTRAINT "Venda_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "Produto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Venda_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "Cliente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Venda" ("clienteId", "data_venda", "desconto", "parcelas", "produtoId") SELECT "clienteId", "data_venda", "desconto", "parcelas", "produtoId" FROM "Venda";
DROP TABLE "Venda";
ALTER TABLE "new_Venda" RENAME TO "Venda";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
