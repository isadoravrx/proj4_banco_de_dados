import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class Institution {
    @PrimaryGeneratedColumn() // Primary Key
    id: number;

    @Column({type: 'varchar', nullable: true})
    cnpj: string;

    @Column({ type: 'varchar', nullable: true })
    cellphone: string;

    @Column({ type: 'varchar', nullable: true })
    street: string;

    @Column({ type: 'int', nullable: true })
    number: number;

    @Column({ type: 'varchar', nullable: true })
    neighborhood: string;

    @Column({ type: 'varchar', nullable: true })
    email: string;
}
