//
//  Supabase.swift
//  Automa
//
//  Created by Simon Ferns on 2024/05/03.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://wvzgejpisuukgnohsimu.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind2emdlanBpc3V1a2dub2hzaW11Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMzMjMwOTQsImV4cCI6MjAyODg5OTA5NH0.9PrMYgTH6oDILXKeaV7eCGJbFDdNYosAp2j0mxvmaLI"
)
