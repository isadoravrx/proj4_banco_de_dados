import { Entity, PrimaryColumn, Column } from "typeorm";

@Entity()
export class Publisher {
    @PrimaryColumn()
    name: string;

    @Column()
    email: string;

    @Column()
    number: number;

    @Column()
    street: string;

    @Column()
    neighborhood: string;

    @Column()
    telephone: string;
}
