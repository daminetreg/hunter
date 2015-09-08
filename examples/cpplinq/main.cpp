#include <iostream>
#include <utility>
#include <CppLinq/cpplinq.hpp>

struct customer
{
    std::size_t     id          ;
    std::string     first_name  ;
    std::string     last_name   ;
};

struct customer_address
{
    std::size_t     id          ;
    std::size_t     customer_id ;
    std::string     country     ;
};

int main(int argc, char** argv) {

  customer customers[] = 
  {
      customer {1 , "Bill"    , "Gates"   },
      customer {2 , "Steve"   , "Jobs"    },
      customer {3 , "Richard" , "Stallman"},
      customer {4 , "Linus"   , "Torvalds"},
  };

  customer_address customer_addresses[] =
  {
      customer_address {1, 1, "USA"       },
      customer_address {2, 4, "Finland"   },
      customer_address {3, 4, "USA"       },
      customer_address {4, 2, "FRANCE"       },
  };


  using namespace cpplinq;
  auto result = 
     from_array(customers)                                                                   
      >> join (
              from_array(customer_addresses),
              [](customer const & c) {return c.id;},
              [](customer_address const & ca) {return ca.customer_id;},
              [](customer const & c, customer_address const & ca) {return std::make_pair (c, ca);}
         )
      >> to_vector();
}
