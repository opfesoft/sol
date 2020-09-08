#include "SFMTEngine.h"
#include "Errors.h"
#include <random>
#include <openssl/rand.h>

static SFMTEngine engine;

// Class for SFMT generator
class SFMTRand                                // Encapsulate random number generator
{
    friend class ACE_TSS<SFMTRand>;

    public:
        SFMTRand()
        {
            std::random_device dev;
            if (dev.entropy() > 0)
            {
                std::array<uint32, SFMT_N32> seed;
                std::generate(seed.begin(), seed.end(), std::ref(dev));

                sfmt_init_by_array(&_state, seed.data(), seed.size());
            }
            else
                sfmt_init_gen_rand(&_state, uint32(time(nullptr)));
        }

        int32 IRandom(int32 min, int32 max)
        {
            std::uniform_int_distribution<int32> uid(min, max);
            return uid(engine);
        }

        uint32 URandom(uint32 min, uint32 max)
        {
            std::uniform_int_distribution<uint32> uid(min, max);
            return uid(engine);
        }

        float FRandom(float min, float max)
        {
            std::uniform_real_distribution<float> urd(min, max);
            return urd(engine);
        }

        uint32_t RandomUInt32()
        {
            return sfmt_genrand_uint32(&_state);
        }

        uint32_t CryptoRandomUInt32()
        {
            unsigned char buf[4];
            int r = RAND_bytes(buf, 4);
            ASSERT(r == 1, "error CryptoRandomUInt32");
            uint32_t n = 0;
            memcpy(&n, buf, 4);
            return n;
        }

        double RandomNorm()
        {
            std::uniform_real_distribution<double> urd;
            return urd(engine);
        }

        double RandomChance()
        {
            std::uniform_real_distribution<double> urd(0.0, 100.0);
            return urd(engine);
        }

        uint32 URandomWeighted(size_t count, double const* chances)
        {
            std::discrete_distribution<uint32> dd(chances, chances + count);
            return dd(engine);
        }

    private:
        sfmt_t _state;
};
