function App() {
  return (
    <main className="min-h-screen flex items-center justify-center bg-neutral-950 text-neutral-100 p-8">
      <div className="max-w-xl text-center space-y-4">
        <p className="text-sm font-mono tracking-widest text-emerald-400">
          halditech-landing · starter template
        </p>
        <h1 className="text-4xl font-bold">Landing surface — Lovable lane</h1>
        <p className="text-neutral-400">
          This is the starter shell for the HaldiTech landing surface (#546). The OFS team
          builds real pages here, visually, in Lovable. The GTM wiring in{' '}
          <code className="text-neutral-200">index.html</code> is owned by John + Claude and
          protected by <code className="text-neutral-200">AGENTS.md</code> — leave it in place.
        </p>
        <p className="text-xs text-neutral-600">
          GTM-PTNGVBS · deployed via Vercel (haldi-properties)
        </p>
      </div>
    </main>
  )
}

export default App
