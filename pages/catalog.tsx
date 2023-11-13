import { GetServerSideProps } from 'next';
import { Product } from '../types';

interface CatalogProps {
  products: Product[];
}

export const getServerSideProps: GetServerSideProps<CatalogProps> = async () => {
  // Fetch product data from the database
  const products = await fetchProductsFromDatabase();
  return {
    props: {
      products,
    },
  };
};

const Catalog: React.FC<CatalogProps> = ({ products }) => {
  return (
    <div>
      {products.map((product) => (
        <div key={product.id}>
          <h2>{product.name}</h2>
          <p>{product.description}</p>
          <p>{product.price}</p>
        </div>
      ))}
    </div>
  );
};

export default Catalog;