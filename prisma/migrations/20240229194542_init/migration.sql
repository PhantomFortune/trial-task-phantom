/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Users" (
    "user_id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "address" TEXT NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "Layouts" (
    "layout_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "layout_name" TEXT NOT NULL,

    CONSTRAINT "Layouts_pkey" PRIMARY KEY ("layout_id")
);

-- CreateTable
CREATE TABLE "Widgets" (
    "widget_id" SERIAL NOT NULL,
    "widget_name" TEXT NOT NULL,
    "widget_description" TEXT,

    CONSTRAINT "Widgets_pkey" PRIMARY KEY ("widget_id")
);

-- CreateTable
CREATE TABLE "LayoutWidgets" (
    "layout_id" INTEGER NOT NULL,
    "widget_id" INTEGER NOT NULL,
    "widget_config" JSONB NOT NULL,

    CONSTRAINT "LayoutWidgets_pkey" PRIMARY KEY ("layout_id","widget_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- AddForeignKey
ALTER TABLE "Layouts" ADD CONSTRAINT "Layouts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LayoutWidgets" ADD CONSTRAINT "LayoutWidgets_layout_id_fkey" FOREIGN KEY ("layout_id") REFERENCES "Layouts"("layout_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LayoutWidgets" ADD CONSTRAINT "LayoutWidgets_widget_id_fkey" FOREIGN KEY ("widget_id") REFERENCES "Widgets"("widget_id") ON DELETE RESTRICT ON UPDATE CASCADE;
