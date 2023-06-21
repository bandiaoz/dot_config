local ls = require('luasnip')

local parse_snippet = ls.parser.parse_snippet

return {
    s('dir', t('const vector<pair<int, int>> dir{{1, 0}, {-1, 0}, {0, 1}, {0, -1}};')),
    s('dir8', t('const vector<pair<int, int>> dir{{1, 0}, {-1, 0}, {0, 1}, {0, -1}, {1, 1}, {1, -1}, {-1, 1}, {-1, -1}};')),
    s('mint', {
        parse_snippet(1, [[
template <int MOD>
struct ModInt {
    int val;
    ModInt(ll v = 0) : val(v % MOD) { if (val < 0) val += MOD; };
    ModInt operator+() const { return ModInt(val); }
    ModInt operator-() const { return ModInt(MOD - val); }
    ModInt inv() const {
        auto a = val, m = MOD, u = 0, v = 1;
        while (a != 0) { auto t = m / a; m -= t * a; swap(a, m); u -= t * v; swap(u, v); }
        assert(m == 1);
        return u;
    }
    ModInt pow(ll n) const {
        auto x = ModInt(1);
        auto b = *this;
        while (n > 0) {
            if (n & 1) x *= b;
            n >>= 1;
            b *= b;
        }
        return x;
    }
    friend ModInt operator+ (ModInt lhs, const ModInt& rhs) { return lhs += rhs; }
    friend ModInt operator- (ModInt lhs, const ModInt& rhs) { return lhs -= rhs; }
    friend ModInt operator* (ModInt lhs, const ModInt& rhs) { return lhs *= rhs; }
    friend ModInt operator/ (ModInt lhs, const ModInt& rhs) { return lhs /= rhs; }
    ModInt& operator+=(const ModInt& x) { if ((val += x.val) >= MOD) val -= MOD; return *this; }
    ModInt& operator-=(const ModInt& x) { if ((val -= x.val) < 0) val += MOD; return *this; }
    ModInt& operator*=(const ModInt& x) { val = int64_t(val) * x.val % MOD; return *this; }
    ModInt& operator/=(const ModInt& x) { return *this *= x.inv(); }
    bool operator==(const ModInt& b) const { return val == b.val; }
    bool operator!=(const ModInt& b) const { return val != b.val; }
    friend std::istream& operator>>(std::istream& is, ModInt& x) noexcept { return is >> x.val; }
    friend std::ostream& operator<<(std::ostream& os, const ModInt& x) noexcept { return os << x.val; }
};

]]),
        c(2, { t"using mint = ModInt<1'000'000'007>;", t"using mint = ModInt<998244353>;" })
        }
    ),
    parse_snippet('mini', [[
#include <bits/stdc++.h>
using namespace std;
#ifndef LOCAL // https://tgc54.com/posts/debug_output_header/
#define de(...)
#define de2(...)
#endif
using ll = long long;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    $0
    return 0;
}
    ]]),
    parse_snippet('temp', [[
#include <bits/stdc++.h>
using namespace std;
#ifndef LOCAL // https://tgc54.com/posts/debug_output_header/
#define de(...)
#define de2(...)
#endif
using ll = long long;

void test_case() {
	$0
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int tt = 1;
    cin >> tt;
    while (tt--) {
        test_case();
    }
}
    ]]),
    parse_snippet('monoid', [[
struct OP {
    using S = ;
    using F = ;
    static S e() {

    }
    static S op(const S& x, const S& y) {

    }
    static F id() {

    }
    static S mapping(const F& f, const S& x) {

    }
    static auto composition(F& f, F& g) -> F {

    }
};
    ]]),
    parse_snippet('rng', [[
mt19937 rng(chrono::steady_clock::now().time_since_epoch().count());
int gen(int l, int r) {
    assert(l <= r);
    return rng() % (r - l + 1) + l;
}
    ]]),
    parse_snippet('uf', [[
struct UF {
    vector<int> fa, sz;
    UF(int n) : fa(n), sz(n, 1) { iota(fa.begin(), fa.end(), 0); }

    int find(int x) { return fa[x] == x ? x : fa[x] = find(fa[x]); }

    bool same(int x, int y) { return find(x) == find(y); }

    bool join(int x, int y) {
        x = find(x), y = find(y);
        if (x == y) return false;
        if (sz[x] > sz[y]) swap(x, y);
        fa[x] = y;
        sz[y] += sz[x];
        return true;
    }
};
    ]]),
    parse_snippet('minheap', 'template<typename T> using min_heap = priority_queue<T, vector<T>, greater<>>;'),
}
