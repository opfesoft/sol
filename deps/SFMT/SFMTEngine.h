/*
* SFMT wrapper satisfying UniformRandomNumberGenerator concept for use in <random> algorithms
*/
class SFMTEngine
{
public:
    typedef uint32 result_type;

    static constexpr result_type min() { return std::numeric_limits<result_type>::min(); }
    static constexpr result_type max() { return std::numeric_limits<result_type>::max(); }
    result_type operator()() const { return rand32(); }
};
