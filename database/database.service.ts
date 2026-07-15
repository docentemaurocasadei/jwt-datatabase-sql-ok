import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Pool, createPool } from 'mysql2/promise';
@Injectable()
export class DatabaseService {
    private pool!: Pool;

    constructor(private configService: ConfigService) {
    }
    async onModuleInit() {
        await this.connect();
    }
    async connect() {
        this.pool = createPool({
            host: this.configService.get<string>('DB_HOST'),
            user: this.configService.get<string>('DB_USER'),
            password: this.configService.get<string>('DB_PASSWORD'),
            database: this.configService.get<string>('DB_NAME'),
        });
    }

    async disconnect() {
        if (this.pool) {
            await this.pool.end();
        }
    }
    async query(sql: string, params?: any[]): Promise<any> {
        if (!this.pool) {
            throw new Error('Database connection is not established.');
        }
        const [results] = await this.pool.execute(sql, params);
        return results;
    }
}
