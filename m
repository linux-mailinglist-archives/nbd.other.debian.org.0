Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE96727B84
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 11:34:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8E13F204CA; Thu,  8 Jun 2023 09:34:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 09:34:31 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E9A13204C5
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 09:34:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.191 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XCR8Uc_-_nff for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 09:34:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 578BB204C2
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 09:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686216848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k8ZwYv9vwJFChJabdN21ijpMXYACIyc68rki/UQwDEA=;
	b=Eb5xyjPchE39cHRyKc8ezly3rPYD+4IK0GzPv7npovXQn0nEKWjhWIINZP7jobvN89Zmei
	QBZR7GWS02nB02aEOe7ZI4vuAZ7F7F0ZTOK0Iq0l8nkuM7fXoD4vXOu7YCiRL0c1G4DE/w
	JfLHXv2NoZoxsJSZo5UhklMz0wegrnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-Pklh3nRUNj-5xmRi1PjuTA-1; Thu, 08 Jun 2023 05:34:04 -0400
X-MC-Unique: Pklh3nRUNj-5xmRi1PjuTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96605185A7A9;
	Thu,  8 Jun 2023 09:34:04 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 514949E9C;
	Thu,  8 Jun 2023 09:34:04 +0000 (UTC)
Date: Thu, 8 Jun 2023 10:34:03 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [libnbd PATCH v3 15/22] info: Update nbdinfo --map to use 64-bit
 block status
Message-ID: <20230608093403.GL7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-16-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230525130108.757242-16-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <85xuKcbzyMI.A.pnE.nCagkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2534
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608093403.GL7773@redhat.com
Resent-Date: Thu,  8 Jun 2023 09:34:31 +0000 (UTC)

On Thu, May 25, 2023 at 08:01:01AM -0500, Eric Blake wrote:
> Although we usually map "base:allocation" which doesn't require the
> use of the 64-bit API for flags, this application IS intended to map
> out other metacontexts that might have 64-bit flags.  And when
> extended headers are in use, we might as well ask for the server to
> give us extents as large as it wants, rather than breaking things up
> at 4G boundaries.
> 
> At the time this patch was written, there are no known servers that
> actually provide a metacontext with 64-bit flags.  However, that is
> planned for the nbdkit v3 protocol.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  info/map.c | 65 ++++++++++++++++++++++++++++--------------------------
>  1 file changed, 34 insertions(+), 31 deletions(-)
> 
> diff --git a/info/map.c b/info/map.c
> index 1169fce4..50b058f2 100644
> --- a/info/map.c
> +++ b/info/map.c
> @@ -36,13 +36,13 @@
> 
>  #include "nbdinfo.h"
> 
> -DEFINE_VECTOR_TYPE (uint32_vector, uint32_t);
> +DEFINE_VECTOR_TYPE (uint64_vector, uint64_t);
> 
> -static void print_extents (uint32_vector *entries);
> -static void print_totals (uint32_vector *entries, int64_t size);
> +static void print_extents (uint64_vector *entries);
> +static void print_totals (uint64_vector *entries, int64_t size);
>  static int extent_callback (void *user_data, const char *metacontext,
>                              uint64_t offset,
> -                            uint32_t *entries, size_t nr_entries,
> +                            nbd_extent *entries, size_t nr_entries,
>                              int *error);
> 
>  void
> @@ -50,7 +50,7 @@ do_map (void)
>  {
>    size_t i;
>    int64_t size;
> -  uint32_vector entries = empty_vector;
> +  uint64_vector entries = empty_vector;
>    uint64_t offset, align, max_len;
>    size_t prev_entries_size;
> 
> @@ -69,14 +69,16 @@ do_map (void)
>      fprintf (stderr, "%s: %s\n", progname, nbd_get_error ());
>      exit (EXIT_FAILURE);
>    }
> +  if (nbd_get_extended_headers_negotiated (nbd) == 1)
> +    max_len = size;
> 
>    for (offset = 0; offset < size;) {
>      prev_entries_size = entries.len;
> -    if (nbd_block_status (nbd, MIN (size - offset, max_len), offset,
> -                          (nbd_extent_callback) {
> -                            .callback = extent_callback,
> -                            .user_data = &entries },
> -                          0) == -1) {
> +    if (nbd_block_status_64 (nbd, MIN (size - offset, max_len), offset,
> +                             (nbd_extent64_callback) {
> +                               .callback = extent_callback,
> +                               .user_data = &entries },
> +                             0) == -1) {
>        fprintf (stderr, "%s: %s\n", progname, nbd_get_error ());
>        exit (EXIT_FAILURE);
>      }
> @@ -99,18 +101,18 @@ do_map (void)
>  }
> 
>  /* Callback handling --map. */
> -static void print_one_extent (uint64_t offset, uint64_t len, uint32_t type);
> -static void extent_description (const char *metacontext, uint32_t type,
> +static void print_one_extent (uint64_t offset, uint64_t len, uint64_t type);
> +static void extent_description (const char *metacontext, uint64_t type,
>                                  char **descr, bool *free_descr,
>                                  const char **fg, const char **bg);
> 
>  static int
>  extent_callback (void *user_data, const char *metacontext,
>                   uint64_t offset,
> -                 uint32_t *entries, size_t nr_entries,
> +                 nbd_extent *entries, size_t nr_entries,
>                   int *error)
>  {
> -  uint32_vector *list = user_data;
> +  uint64_vector *list = user_data;
>    size_t i;
> 
>    if (strcmp (metacontext, map) != 0)
> @@ -120,7 +122,8 @@ extent_callback (void *user_data, const char *metacontext,
>     * print_extents below.
>     */
>    for (i = 0; i < nr_entries; ++i) {
> -    if (uint32_vector_append (list, entries[i]) == -1) {
> +    if (uint64_vector_append (list, entries[i].length) == -1 ||
> +        uint64_vector_append (list, entries[i].flags) == -1) {
>        perror ("realloc");
>        exit (EXIT_FAILURE);
>      }
> @@ -129,7 +132,7 @@ extent_callback (void *user_data, const char *metacontext,
>  }
> 
>  static void
> -print_extents (uint32_vector *entries)
> +print_extents (uint64_vector *entries)
>  {
>    size_t i, j;
>    uint64_t offset = 0;          /* end of last extent printed + 1 */
> @@ -138,7 +141,7 @@ print_extents (uint32_vector *entries)
>    if (json_output) fprintf (fp, "[\n");
> 
>    for (i = 0; i < entries->len; i += 2) {
> -    uint32_t type = entries->ptr[last+1];
> +    uint64_t type = entries->ptr[last+1];
> 
>      /* If we're coalescing and the current type is different from the
>       * previous one then we should print everything up to this entry.
> @@ -157,7 +160,7 @@ print_extents (uint32_vector *entries)
> 
>    /* Print the last extent if there is one. */
>    if (last != i) {
> -    uint32_t type = entries->ptr[last+1];
> +    uint64_t type = entries->ptr[last+1];
>      uint64_t len;
> 
>      for (j = last, len = 0; j < i; j += 2)
> @@ -169,7 +172,7 @@ print_extents (uint32_vector *entries)
>  }
> 
>  static void
> -print_one_extent (uint64_t offset, uint64_t len, uint32_t type)
> +print_one_extent (uint64_t offset, uint64_t len, uint64_t type)
>  {
>    static bool comma = false;
>    char *descr;
> @@ -185,7 +188,7 @@ print_one_extent (uint64_t offset, uint64_t len, uint32_t type)
>        ansi_colour (bg, fp);
>      fprintf (fp, "%10" PRIu64 "  "
>               "%10" PRIu64 "  "
> -             "%3" PRIu32,
> +             "%3" PRIu64,
>               offset, len, type);
>      if (descr)
>        fprintf (fp, "  %s", descr);
> @@ -199,7 +202,7 @@ print_one_extent (uint64_t offset, uint64_t len, uint32_t type)
> 
>      fprintf (fp, "{ \"offset\": %" PRIu64 ", "
>               "\"length\": %" PRIu64 ", "
> -             "\"type\": %" PRIu32,
> +             "\"type\": %" PRIu64,
>               offset, len, type);
>      if (descr) {
>        fprintf (fp, ", \"description\": ");
> @@ -215,9 +218,9 @@ print_one_extent (uint64_t offset, uint64_t len, uint32_t type)
> 
>  /* --map --totals suboption */
>  static void
> -print_totals (uint32_vector *entries, int64_t size)
> +print_totals (uint64_vector *entries, int64_t size)
>  {
> -  uint32_t type;
> +  uint64_t type;
>    bool comma = false;
> 
>    /* This is necessary to avoid a divide by zero below, but if the
> @@ -237,16 +240,16 @@ print_totals (uint32_vector *entries, int64_t size)
>     */
>    type = 0;
>    for (;;) {
> -    uint64_t next_type = (uint64_t)UINT32_MAX + 1;
> +    uint64_t next_type = 0;
>      uint64_t c = 0;
>      size_t i;
> 
>      for (i = 0; i < entries->len; i += 2) {
> -      uint32_t t = entries->ptr[i+1];
> +      uint64_t t = entries->ptr[i+1];
> 
>        if (t == type)
>          c += entries->ptr[i];
> -      else if (type < t && t < next_type)
> +      else if (type < t && (next_type == 0 || t < next_type))
>          next_type = t;
>      }
> 
> @@ -263,7 +266,7 @@ print_totals (uint32_vector *entries, int64_t size)
>            ansi_colour (fg, fp);
>          if (bg)
>            ansi_colour (bg, fp);
> -        fprintf (fp, "%10" PRIu64 " %5.1f%% %3" PRIu32,
> +        fprintf (fp, "%10" PRIu64 " %5.1f%% %3" PRIu64,
>                   c, percent, type);
>          if (descr)
>            fprintf (fp, " %s", descr);
> @@ -278,7 +281,7 @@ print_totals (uint32_vector *entries, int64_t size)
>          fprintf (fp,
>                   "{ \"size\": %" PRIu64 ", "
>                   "\"percent\": %g, "
> -                 "\"type\": %" PRIu32,
> +                 "\"type\": %" PRIu64,
>                   c, percent, type);
>          if (descr) {
>            fprintf (fp, ", \"description\": ");
> @@ -292,7 +295,7 @@ print_totals (uint32_vector *entries, int64_t size)
>          free (descr);
>      }
> 
> -    if (next_type == (uint64_t)UINT32_MAX + 1)
> +    if (next_type == 0)
>        break;
>      type = next_type;
>    }
> @@ -301,7 +304,7 @@ print_totals (uint32_vector *entries, int64_t size)
>  }
> 
>  static void
> -extent_description (const char *metacontext, uint32_t type,
> +extent_description (const char *metacontext, uint64_t type,
>                      char **descr, bool *free_descr,
>                      const char **fg, const char **bg)
>  {
> @@ -348,7 +351,7 @@ extent_description (const char *metacontext, uint32_t type,
>        *fg = ANSI_FG_BRIGHT_WHITE; *bg = ANSI_BG_BLACK;
>        return;
>      default:
> -      if (asprintf (descr, "backing depth %u", type) == -1) {
> +      if (asprintf (descr, "backing depth %" PRIu64, type) == -1) {
>          perror ("asprintf");
>          exit (EXIT_FAILURE);
>        }

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

