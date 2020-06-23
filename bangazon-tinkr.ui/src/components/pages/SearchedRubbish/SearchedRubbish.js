import React from 'react';
import SearchInput from '../../shared/SearchInput/SearchInput';
import productData from '../../../helpers/data/productData';
import ProductGrid from '../../shared/ProductGrid/ProductGrid';
import ProductCard from '../../shared/ProductCard/ProductCard';
import Dropdown  from '../../shared/DropDown/DropDown';

class SearchedRubbish extends React.Component {
  state = {
    filteredProducts: []
  }

  getRubbishByName = () => {
    const name = this.props.match.params.searchTerm;
    // const { searchTerm } = this.props;
    productData.getRubbishByName(name)
    .then((response) => { 
      this.setState({
        filteredProducts: response
          });
    })
      .catch((err) => console.error('error from get search product', err));
  }

  componentDidMount() {
    const name = this.props.match.params.searchTerm
    this.getRubbishByName(name);
  }

  render() {
    return (
      <>
        <ProductGrid
          products={this.state.filteredProducts}
        /> 
      </>
    );
  }
}

export default SearchedRubbish ;
