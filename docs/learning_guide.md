# Learning Guide (Gemini)
## Phase 1: The Anatomy of a Transaction (The TLP)
* The TLP Header: Decoding the 3-DW and 4-DW headers. Understanding Format (Fmt) and Type fields.
* Addressing & Routing: Address-based (Mem/IO), ID-based (Configuration/Completions), and Implicit (Messages).
* The "Payload" Reality: How Max Payload Size (MPS) and Max Read Request Size (MRRS) dictate your actual AXI-Stream throughput.
* The Completion Model: How the Host handles "Non-Posted" requests and why "Tags" are the most valuable resource in your design.

## Phase 2: Credit-Based Flow Control (The "Throttle")
* The Virtual Channel (VC) Myth: Why you usually only have one, and how it’s shared.
* Flow Control Units (FLITs) vs. Credits: Understanding UpdateFC messages.
* Deadlock Avoidance: How the hardware separates Posted (P), Non-Posted (NP), and Completion (CPL) credits to prevent the bus from locking up.
* Hardware Impact: Calculating how much internal FIFO depth you need to "hide" the round-trip latency of the PCIe bus.

## Phase 3: The Gen 4 Physical & Data Link Reality
* 16 GT/s Challenges
* 128b/130b Encoding: Moving away from the 8b/10b overhead of Gen 2.
* LCRC and Sequence Numbers: How the Data Link Layer handles "Replay"—what happens to your logic when a packet is corrupted and the IP core has to "rewind" the bus?
* Equalization (EQ): The Phase 0–3 negotiation that happens before your logic even wakes up.

## Phase 4: Performance Tuning & Accelerator Patterns
* Relaxed Ordering (RO) & No Snoop (NS): The two bits in the TLP header that can increase your DMA performance by 20–30% by bypassing CPU cache coherency bottlenecks.
* The "Tag" Bottleneck: Why modern accelerators need to support 256 or 768 tags to keep the "pipe" full.
* Interrupts (MSI-X): Moving away from legacy interrupts to memory-mapped event signaling.
* Atomic Operations: How Gen 4 handles "Fetch and Add" or "Compare and Swap" directly in the fabric.

# Expert Lens Review (Hardware Accelerator Perspective)
* Emphasis on Tags/Credits: In Gen 4, the "Wire" is so fast that the bottleneck is almost always the management of outstanding requests. If your logic only issues one read at a time, you'll utilize less than 1% of the Gen 4 bandwidth.
* Focus on "Non-Posted" Logic: Most beginners struggle with the fact that Writes (Posted) are "fire and forget," while Reads (Non-Posted) require a state machine to wait for a completion that might arrive out of order.
* The "No Snoop" Factor: For high-performance accelerators (like AI/ML or Video Transcoding), understanding how to signal the CPU that "I don't need you to check your L3 cache for this data" is the difference between 15GB/s and 12GB/s.
* The FEC/Latency Trade-off: Knowing that Gen 4 has a higher base latency than Gen 3 (due to FEC) helps you design better pre-fetch logic in your DMA.
