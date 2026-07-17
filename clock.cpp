#include <iostream>
#include <iomanip>
#include <chrono>
#include <format>
#include <thread>

using namespace std;

int main() {
  while (true)
  {
    std::this_thread::sleep_for(std::chrono::seconds(1));

    auto now = std::chrono::system_clock::now();

    std::time_t server_time = std::chrono::system_clock::to_time_t(now);
    std::tm* time_info = std::localtime(&server_time);
    std::cout << "Server Time: " << std::put_time(time_info, "%Y-%m%d %H:%M:%S") << std::endl;
  }
  
  return 0;
}