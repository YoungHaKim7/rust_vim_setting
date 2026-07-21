#include <cmath>
#include <iostream>
#include <numeric>
#include <ranges>
#include <vector>

// Sum function for ranges
template <typename R> auto sum(R &&range) {
    using ValueType = typename std::ranges::range_value_t<R>;
    return std::accumulate(std::ranges::begin(range), std::ranges::end(range),
                           ValueType{0});
}

int main() {
    std::cout << "Hello world C++ - Single-threaded version\n\n";

    // Create 100,000 elements
    std::vector<double> xs(100'000);
    for (size_t i = 0; i < xs.size(); ++i) {
        xs[i] = static_cast<double>(i + 1);
    }
    std::cout << "Total elements: " << xs.size() << "\n";

    // Transform and sum in a single pass (single-threaded)
    auto transformed = xs | std::ranges::views::transform(
                                [](double x) { return std::sqrt(x); });
    double total_sum = sum(transformed);

    std::cout << "Total sum of sqrt(1..100000): " << total_sum << "\n";

    return 0;
}
