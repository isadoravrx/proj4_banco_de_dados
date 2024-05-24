import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";

@Entity()
export class Author {
    @PrimaryGeneratedColumn() // Primary Key
    authorId: number;

    @Column()
    firstName: string;

    @Column()
    lastName: string;

    @Column({ type: 'date' })
    dateOfBirth: Date;

    @Column({ type: 'char', length: 1 })
    gender: string;
}
