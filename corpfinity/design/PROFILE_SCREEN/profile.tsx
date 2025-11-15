import { Icon } from "@iconify/react";

export function Profile() {
	return (
		<div className="flex flex-col min-h-screen bg-background">
			<div className="flex-1 pb-24">
				<div className="px-6 pt-12 pb-6">
					<div className="flex items-center gap-4 mb-2">
						<button className="relative">
							<img
								src="https://randomuser.me/api/portraits/women/44.jpg"
								alt="Profile"
								className="size-20 rounded-full object-cover border-2 border-primary"
							/>
							<div className="absolute -bottom-1 -right-1 size-7 bg-primary rounded-full flex items-center justify-center shadow-lg">
								<Icon icon="solar:camera-bold" className="size-4 text-primary-foreground" />
							</div>
						</button>
						<div>
							<h1 className="text-2xl font-semibold text-foreground font-heading">
								Sarah Mitchell
							</h1>
							<p className="text-sm text-muted-foreground">sarah.mitchell@email.com</p>
						</div>
					</div>
				</div>
				<div className="px-6 mb-6">
					<div className="bg-card rounded-2xl p-5 shadow-sm">
						<h2 className="text-xs font-medium text-muted-foreground uppercase tracking-wide mb-4">
							This Week
						</h2>
						<div className="grid grid-cols-3 gap-4">
							<div className="text-center">
								<div className="text-2xl font-bold text-foreground mb-1">127</div>
								<div className="text-xs text-muted-foreground">Minutes</div>
							</div>
							<div className="text-center">
								<div className="text-2xl font-bold text-foreground mb-1">6</div>
								<div className="text-xs text-muted-foreground">Sessions</div>
							</div>
							<div className="text-center">
								<div className="text-2xl font-bold text-foreground mb-1">4</div>
								<div className="text-xs text-muted-foreground">Day Streak</div>
							</div>
						</div>
					</div>
				</div>
				<div className="px-6 space-y-6">
					<div>
						<h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-3 px-2">
							Personal
						</h3>
						<div className="bg-card rounded-2xl shadow-sm overflow-hidden">
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">Edit Profile</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
							<div className="h-px bg-border mx-4" />
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">Login devices</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
						</div>
					</div>
					<div>
						<h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-3 px-2">
							Reminders & Notifications
						</h3>
						<div className="bg-card rounded-2xl shadow-sm overflow-hidden">
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">Wellness Reminders</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
							<div className="h-px bg-border mx-4" />
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">Push Notifications</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
						</div>
					</div>
					<div>
						<h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-3 px-2">
							Goals & Preferences
						</h3>
						<div className="bg-card rounded-2xl shadow-sm overflow-hidden">
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">Weekly Goal</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
							<div className="h-px bg-border mx-4" />
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">Default Session Length</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
							<div className="h-px bg-border mx-4" />
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">Language</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
						</div>
					</div>
					<div>
						<h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-3 px-2">
							Privacy & Data
						</h3>
						<div className="bg-card rounded-2xl shadow-sm overflow-hidden">
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">Privacy Settings</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
							<div className="h-px bg-border mx-4" />
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">Export / Backup</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
							<div className="h-px bg-border mx-4" />
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-destructive">Delete Account</span>
								<Icon icon="solar:alt-arrow-right-linear" className="size-5 text-destructive" />
							</button>
						</div>
					</div>
					<div>
						<h3 className="text-xs font-semibold text-muted-foreground uppercase tracking-wide mb-3 px-2">
							Support
						</h3>
						<div className="bg-card rounded-2xl shadow-sm overflow-hidden">
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">FAQ</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
							<div className="h-px bg-border mx-4" />
							<button className="w-full flex items-center justify-between px-4 py-4 active:bg-muted/50 transition-colors">
								<span className="text-sm font-medium text-foreground">Contact Support</span>
								<Icon
									icon="solar:alt-arrow-right-linear"
									className="size-5 text-muted-foreground"
								/>
							</button>
						</div>
					</div>
					<div className="space-y-3 pt-2 pb-6">
						<button className="w-full py-4 px-6 bg-primary text-primary-foreground rounded-2xl font-semibold shadow-sm active:scale-98 transition-transform">
							Share Progress
						</button>
						<button className="w-full py-4 px-6 bg-secondary text-secondary-foreground rounded-2xl font-semibold shadow-sm active:scale-98 transition-transform">
							Sign Out
						</button>
					</div>
				</div>
			</div>
		</div>
	);
}
