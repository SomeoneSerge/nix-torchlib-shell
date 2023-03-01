#include <iostream>
#include <torch/torch.h>

int main(int argc, char **argv) {
  torch::NoGradGuard noGrad;
  auto tensor =
      torch::randn({1024, 1024}, torch::TensorOptions().device(torch::kCUDA));
  std::cout << "My number is: " << tensor.sum() << std::endl;
  return 0;
}
