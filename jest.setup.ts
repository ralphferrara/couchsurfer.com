jest.mock('@prisma/client', () => {
const mPrismaClient = {
      user: {
      findMany: jest.fn(),
      },
};
return { PrismaClient: jest.fn(() => mPrismaClient) };
});