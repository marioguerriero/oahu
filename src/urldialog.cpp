#include "urldialog.h"
#include "ui_urldialog.h"

UrlDialog::UrlDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::UrlDialog)
{
    ui->setupUi(this);
}

UrlDialog::~UrlDialog()
{
    delete ui;
}

void UrlDialog::on_cancelButton_clicked()
{
    destroy();
}

void UrlDialog::on_openButton_clicked()
{
    //setVideoSoure(ui->urlEntry->text());
}
