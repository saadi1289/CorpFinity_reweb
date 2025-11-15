"use client";

import { motion } from "motion/react";
import { Icon } from "@iconify/react";

export function ActiveChallengeSession() {
	return (
		<div className="flex flex-col h-screen bg-background">
			<div className="flex items-center justify-between px-4 py-4 bg-background/80 backdrop-blur-sm">
				<button className="flex items-center justify-center size-10">
					<Icon icon="solar:close-circle-linear" className="size-6 text-primary" />
				</button>
				<div className="flex flex-col items-center">
					<h1 className="text-lg font-bold font-heading">Morning Mindfulness</h1>
					<p className="text-sm text-muted-foreground">Activity 2 of 4</p>
				</div>
				<button className="flex items-center justify-center size-10">
					<Icon icon="solar:menu-dots-bold" className="size-6 text-foreground" />
				</button>
			</div>
			<div className="flex-1 overflow-y-auto px-4 pb-6">
				<div className="flex flex-col items-center mt-8 mb-6">
					<div className="relative">
						<svg className="size-48 -rotate-90" viewBox="0 0 200 200">
							<circle cx="100" cy="100" r="90" fill="none" stroke="#E8F6F5" strokeWidth="8" />
							<motion.circle
								cx="100"
								cy="100"
								r="90"
								fill="none"
								stroke="#5FCCC4"
								strokeWidth="8"
								strokeLinecap="round"
								strokeDasharray="565.48"
								strokeDashoffset="141.37"
							/>
						</svg>
						<div className="absolute inset-0 flex flex-col items-center justify-center">
							<div className="text-5xl font-bold text-foreground">2:30</div>
							<div className="text-sm text-muted-foreground mt-1">Remaining</div>
						</div>
					</div>
				</div>
				<div className="flex flex-col items-center mb-8">
					<motion.button className="flex items-center justify-center size-20 rounded-full border-4 border-primary bg-background shadow-lg">
						<Icon icon="solar:pause-bold" className="size-8 text-primary" />
					</motion.button>
					<p className="text-sm font-medium text-foreground mt-3">Pause</p>
				</div>
				<div className="bg-card rounded-3xl p-6 shadow-sm mb-6 relative overflow-hidden">
					<div
						className="absolute inset-0 opacity-[0.03]"
						style="background-image: radial-gradient(circle at 2px 2px, currentColor 1px, transparent 0); background-size: 24px 24px;"
					/>
					<div className="relative z-10">
						<div className="flex justify-center mb-4">
							<div className="flex items-center justify-center size-16 rounded-full bg-secondary">
								<Icon icon="solar:wind-bold" className="size-8 text-primary" />
							</div>
						</div>
						<h2 className="text-2xl font-bold text-center mb-6 font-heading">Deep Breathing</h2>
						<div className="space-y-3 mb-6">
							<div className="flex items-start gap-3">
								<div className="size-2 rounded-full bg-primary mt-2 shrink-0" />
								<p className="text-base text-foreground">Inhale for 4 seconds</p>
							</div>
							<div className="flex items-start gap-3">
								<div className="size-2 rounded-full bg-primary mt-2 shrink-0" />
								<p className="text-base text-foreground">Hold for 4 seconds</p>
							</div>
							<div className="flex items-start gap-3">
								<div className="size-2 rounded-full bg-primary mt-2 shrink-0" />
								<p className="text-base text-foreground">Exhale for 4 seconds</p>
							</div>
							<div className="flex items-start gap-3">
								<div className="size-2 rounded-full bg-primary mt-2 shrink-0" />
								<p className="text-base text-foreground">Repeat cycle</p>
							</div>
						</div>
						<div className="flex justify-center" />
					</div>
				</div>
				<div className="flex items-center justify-center gap-3 mb-8">
					<motion.button className="flex items-center gap-2 px-6 py-3 rounded-full bg-secondary border border-border">
						<Icon icon="solar:skip-previous-bold" className="size-5 text-primary" />
						<span className="text-sm font-medium text-foreground">Previous</span>
					</motion.button>
					<motion.button className="flex items-center gap-2 px-6 py-3 rounded-full bg-secondary border border-border">
						<span className="text-sm font-medium text-foreground">Next</span>
						<Icon icon="solar:skip-next-bold" className="size-5 text-primary" />
					</motion.button>
				</div>
				<div className="mb-6">
					<h3 className="text-sm font-semibold text-muted-foreground uppercase tracking-wide mb-4 px-1">
						Activity Progress
					</h3>
					<div className="space-y-2">
						<div className="flex items-center gap-4 px-4 py-3 rounded-xl bg-background">
							<div className="flex items-center justify-center size-6 shrink-0">
								<Icon icon="solar:check-circle-bold" className="size-6 text-primary" />
							</div>
							<div className="flex-1">
								<p className="text-base text-foreground">Warm Up</p>
							</div>
							<p className="text-sm text-muted-foreground">3 min</p>
						</div>
						<div className="flex items-center gap-4 px-4 py-3 rounded-xl bg-secondary border-l-4 border-primary">
							<div className="flex items-center justify-center size-6 shrink-0">
								<div className="size-3 rounded-full bg-primary" />
							</div>
							<div className="flex-1">
								<p className="text-base font-bold text-foreground">Deep Breathing</p>
							</div>
							<p className="text-sm font-semibold text-foreground">5 min</p>
						</div>
						<div className="flex items-center gap-4 px-4 py-3 rounded-xl bg-background">
							<div className="flex items-center justify-center size-6 shrink-0">
								<div className="size-3 rounded-full border-2 border-muted-foreground" />
							</div>
							<div className="flex-1">
								<p className="text-base text-muted-foreground">Stretching</p>
							</div>
							<p className="text-sm text-muted-foreground">4 min</p>
						</div>
						<div className="flex items-center gap-4 px-4 py-3 rounded-xl bg-background">
							<div className="flex items-center justify-center size-6 shrink-0">
								<div className="size-3 rounded-full border-2 border-muted-foreground" />
							</div>
							<div className="flex-1">
								<p className="text-base text-muted-foreground">Cool Down</p>
							</div>
							<p className="text-sm text-muted-foreground">3 min</p>
						</div>
					</div>
				</div>
				<div className="flex justify-center pt-4">
					<button className="px-8 py-3 rounded-full border-2 border-border text-foreground font-medium">
						End Session
					</button>
				</div>
			</div>
		</div>
	);
}
