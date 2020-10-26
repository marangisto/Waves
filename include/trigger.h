#pragma once

namespace board
{

void start_trigger()
{
    triga::enable_interrupt<both_edges>();
    trigb::enable_interrupt<both_edges>();
    interrupt::set<interrupt::EXTI15_10>();
}

} // namespace board

template<> void handler<interrupt::EXTI15_10>()
{
    using namespace board;
    extern void trigger_a(bool), trigger_b(bool);

    bool ba = triga::interrupt_pending();
    bool bb = trigb::interrupt_pending();

    if (ba)
        trigger_a(!triga::read());

    if (bb)
        trigger_b(!trigb::read());

    if (ba)
        triga::clear_interrupt();
    if (bb)
        trigb::clear_interrupt();
}

