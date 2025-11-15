import { Icon } from "@iconify/react";

export function Home() {
	return (
		<div className="flex flex-col h-full bg-background">
			<div className="flex items-center justify-between px-4 py-4">
				<div className="size-12 rounded-2xl bg-primary flex items-center justify-center shadow-sm">
					<Icon icon="solar:user-bold" className="size-6 text-primary-foreground" />
				</div>
				<div className="size-12" />
			</div>
			<div className="flex-1 overflow-auto">
				<div className="px-4 pb-24">
					<div
						className="relative mb-6 rounded-3xl overflow-hidden shadow-lg"
						style={{ background: "linear-gradient(135deg, #7DD9D3 0%, #5FCCC4 50%, #3FB5AC 100%)" }}
					>
						<div
							className="absolute inset-0 opacity-20"
							style={{
								backgroundImage:
									"radial-gradient(circle at 20% 30%, rgba(255,255,255,0.3) 0%, transparent 50%), radial-gradient(circle at 80% 70%, rgba(255,255,255,0.2) 0%, transparent 50%), radial-gradient(circle at 50% 50%, rgba(255,255,255,0.15) 0%, transparent 60%)",
							}}
						/>
						<div
							className="absolute inset-0 opacity-10"
							style={{
								backgroundImage:
									"repeating-linear-gradient(45deg, transparent, transparent 10px, rgba(255,255,255,0.1) 10px, rgba(255,255,255,0.1) 20px)",
							}}
						/>
						<div className="relative px-6 py-8">
							<h1 className="text-3xl font-bold text-white mb-2 font-heading">
								Good Morning, Alex
							</h1>
							<p className="text-white text-opacity-90 mb-6">
								Let's make today a balanced and mindful day.
							</p>
							<div className="flex gap-3">
								<div className="px-4 py-2 rounded-full bg-white bg-opacity-20 backdrop-blur-sm border border-white border-opacity-30">
									<p className="text-sm text-white font-medium">Mindful Warrior</p>
								</div>
								<div className="px-4 py-2 rounded-full bg-white bg-opacity-20 backdrop-blur-sm border border-white border-opacity-30">
									<p className="text-sm text-white font-medium">Active Streaker</p>
								</div>
							</div>
						</div>
					</div>
					<div className="mb-6">
						<div className="grid grid-cols-2 gap-3">
							<div className="bg-card rounded-2xl p-4 shadow-sm border border-border">
								<div className="flex items-center justify-between mb-2">
									<h3 className="font-semibold text-foreground">Stress Reduction</h3>
									<Icon icon="solar:meditation-bold" className="size-5 text-primary" />
								</div>
								<div className="h-1 bg-primary rounded-full" />
							</div>
							<div className="bg-card rounded-2xl p-4 shadow-sm border border-border">
								<div className="flex items-center justify-between mb-2">
									<h3 className="font-semibold text-foreground">Increased Energy</h3>
									<Icon icon="solar:bolt-circle-bold" className="size-5 text-primary" />
								</div>
								<div className="h-1 bg-primary rounded-full" />
							</div>
							<div className="bg-card rounded-2xl p-4 shadow-sm border border-border">
								<div className="flex items-center justify-between mb-2">
									<h3 className="font-semibold text-foreground">Better Sleep</h3>
									<Icon icon="solar:moon-bold" className="size-5 text-primary" />
								</div>
								<div className="h-1 bg-primary rounded-full" />
							</div>
							<div className="bg-card rounded-2xl p-4 shadow-sm border border-border">
								<div className="flex items-center justify-between mb-2">
									<h3 className="font-semibold text-foreground">Physical Fitness</h3>
									<Icon icon="solar:dumbbell-bold" className="size-5 text-primary" />
								</div>
								<div className="h-1 bg-primary rounded-full" />
							</div>
							<div className="bg-card rounded-2xl p-4 shadow-sm border border-border">
								<div className="flex items-center justify-between mb-2">
									<h3 className="font-semibold text-foreground">Healthy Eating</h3>
									<Icon icon="solar:leaf-bold" className="size-5 text-primary" />
								</div>
								<div className="h-1 bg-primary rounded-full" />
							</div>
							<div className="bg-card rounded-2xl p-4 shadow-sm border border-border">
								<div className="flex items-center justify-between mb-2">
									<h3 className="font-semibold text-foreground">Social Connection</h3>
									<Icon icon="solar:users-group-rounded-bold" className="size-5 text-primary" />
								</div>
								<div className="h-1 bg-primary rounded-full" />
							</div>
						</div>
					</div>
					<div className="mb-6">
						<h2 className="text-xl font-bold mb-4 font-heading text-foreground">
							Featured Challenge
						</h2>
						<div className="bg-card rounded-3xl p-5 shadow-md border border-border relative overflow-hidden">
							<div className="absolute top-0 right-0 w-32 h-32 bg-primary opacity-5 rounded-full -mr-16 -mt-16" />
							<div className="relative">
								<h3 className="text-lg font-bold mb-2 text-foreground">
									Morning Stretch Challenge
								</h3>
								<div className="flex items-center gap-4 mb-4">
									<div className="flex items-center gap-2">
										<Icon icon="solar:clock-circle-bold" className="size-4 text-primary" />
										<span className="text-sm text-muted-foreground">15 mins</span>
									</div>
									<div className="flex items-center gap-2">
										<Icon icon="solar:fire-bold" className="size-4 text-primary" />
										<span className="text-sm text-muted-foreground">Medium</span>
									</div>
								</div>
								<div className="h-2 bg-secondary rounded-full mb-4">
									<div className="h-full w-1/3 bg-primary rounded-full" />
								</div>
								<button className="w-full py-3 bg-primary text-primary-foreground rounded-2xl font-semibold shadow-sm">
									Start Challenge
								</button>
							</div>
						</div>
					</div>
					<div>
						<h2 className="text-xl font-bold mb-4 font-heading text-foreground">
							Quick Challenges
						</h2>
						<div className="space-y-3">
							<div className="bg-card rounded-2xl p-4 shadow-sm border border-border flex items-center justify-between">
								<div className="flex-1">
									<h3 className="font-semibold text-foreground mb-1">Mindful Breathing</h3>
									<div className="flex items-center gap-2">
										<Icon icon="solar:clock-circle-bold" className="size-4 text-primary" />
										<span className="text-sm text-muted-foreground">3 mins</span>
									</div>
								</div>
								<button className="px-6 py-2 bg-primary text-primary-foreground rounded-xl font-medium shadow-sm">
									Start
								</button>
							</div>
							<div className="bg-card rounded-2xl p-4 shadow-sm border border-border flex items-center justify-between">
								<div className="flex-1">
									<h3 className="font-semibold text-foreground mb-1">Office Stretch</h3>
									<div className="flex items-center gap-2">
										<Icon icon="solar:clock-circle-bold" className="size-4 text-primary" />
										<span className="text-sm text-muted-foreground">5 mins</span>
									</div>
								</div>
								<button className="px-6 py-2 bg-primary text-primary-foreground rounded-xl font-medium shadow-sm">
									Start
								</button>
							</div>
							<div className="bg-card rounded-2xl p-4 shadow-sm border border-border flex items-center justify-between">
								<div className="flex-1">
									<h3 className="font-semibold text-foreground mb-1">Energy Reset</h3>
									<div className="flex items-center gap-2">
										<Icon icon="solar:clock-circle-bold" className="size-4 text-primary" />
										<span className="text-sm text-muted-foreground">7 mins</span>
									</div>
								</div>
								<button className="px-6 py-2 bg-primary text-primary-foreground rounded-xl font-medium shadow-sm">
									Start
								</button>
							</div>
							<div className="bg-card rounded-2xl p-4 shadow-sm border border-border flex items-center justify-between">
								<div className="flex-1">
									<h3 className="font-semibold text-foreground mb-1">Calm Mind</h3>
									<div className="flex items-center gap-2">
										<Icon icon="solar:clock-circle-bold" className="size-4 text-primary" />
										<span className="text-sm text-muted-foreground">10 mins</span>
									</div>
								</div>
								<button className="px-6 py-2 bg-primary text-primary-foreground rounded-xl font-medium shadow-sm">
									Start
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div className="fixed bottom-0 left-0 right-0 bg-background border-t border-border">
				<div className="flex items-center justify-around px-4 py-3">
					<button className="flex flex-col items-center gap-1">
						<Icon icon="solar:home-2-bold" className="size-6 text-primary" />
						<span className="text-xs font-medium text-primary">Home</span>
					</button>
					<button className="flex flex-col items-center gap-1">
						<Icon icon="solar:clipboard-list-bold" className="size-6 text-muted-foreground" />
						<span className="text-xs font-medium text-muted-foreground">Challenges</span>
					</button>
					<button className="flex items-center justify-center size-14 bg-primary rounded-2xl shadow-lg -mt-4">
						<Icon icon="solar:add-circle-bold" className="size-7 text-primary-foreground" />
					</button>
					<button className="flex flex-col items-center gap-1">
						<Icon icon="solar:chart-2-bold" className="size-6 text-muted-foreground" />
						<span className="text-xs font-medium text-muted-foreground">Progress</span>
					</button>
					<button className="flex flex-col items-center gap-1">
						<Icon icon="solar:user-bold" className="size-6 text-muted-foreground" />
						<span className="text-xs font-medium text-muted-foreground">Profile</span>
					</button>
				</div>
			</div>
		</div>
	);
}
