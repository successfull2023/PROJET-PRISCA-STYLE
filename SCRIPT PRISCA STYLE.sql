/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  20/07/2023 11:00:46                      */
/*==============================================================*/


drop table if exists client;

drop table if exists depenses;

drop table if exists mesure;

drop table if exists model;

drop table if exists payment;

drop table if exists personnel;

drop table if exists rendez_vous;

drop table if exists role;

/*==============================================================*/
/* Table : client                                               */
/*==============================================================*/
create table client
(
   id                   int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   email                varchar(254),
   sexe                 varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : depenses                                             */
/*==============================================================*/
create table depenses
(
   id                   int not null,
   pay_id               int,
   libelle              varchar(254),
   montant              int,
   quantite             int,
   date_depense         datetime,
   primary key (id)
);

/*==============================================================*/
/* Table : mesure                                               */
/*==============================================================*/
create table mesure
(
   id                   int not null,
   mod_id               int not null,
   poitrine             int,
   longueur_manche      int,
   longueur_pantalon    int,
   longueur_robe        int,
   tour_de_taille       int,
   bassin               int,
   ceinture             int,
   hanche               int,
   cuisse               int,
   dos                  int,
   primary key (id)
);

/*==============================================================*/
/* Table : model                                                */
/*==============================================================*/
create table model
(
   id                   int not null,
   cli_id               int,
   femme                varchar(254),
   homme                varchar(254),
   enfant               varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : payment                                              */
/*==============================================================*/
create table payment
(
   id                   int not null,
   cli_id               int,
   mode_payment         varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : personnel                                            */
/*==============================================================*/
create table personnel
(
   id                   int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   email                varchar(254),
   specialite           varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : rendez_vous                                          */
/*==============================================================*/
create table rendez_vous
(
   id                   int not null,
   cli_id               int not null,
   date_rdv             datetime,
   primary key (id)
);

/*==============================================================*/
/* Table : role                                                 */
/*==============================================================*/
create table role
(
   id                   int not null,
   per_id               int,
   type_role            varchar(254),
   primary key (id)
);

alter table depenses add constraint FK_Association_3 foreign key (pay_id)
      references payment (id) on delete restrict on update restrict;

alter table mesure add constraint FK_Association_1 foreign key (mod_id)
      references model (id) on delete restrict on update restrict;

alter table model add constraint FK_Association_5 foreign key (cli_id)
      references client (id) on delete restrict on update restrict;

alter table payment add constraint FK_Association_2 foreign key (cli_id)
      references client (id) on delete restrict on update restrict;

alter table rendez_vous add constraint FK_Association_4 foreign key (cli_id)
      references client (id) on delete restrict on update restrict;

alter table role add constraint FK_Association_6 foreign key (per_id)
      references personnel (id) on delete restrict on update restrict;

