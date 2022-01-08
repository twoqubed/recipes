export async function get() {
    return {
      headers: { Location: '/recipes' },
      status: 302
    }
  }