Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1C727B16
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 11:20:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 52AE5204C6; Thu,  8 Jun 2023 09:20:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 09:20:42 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 81937204C1
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 09:20:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.191 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xRlOHCnc1J4Z for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 09:20:23 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id E28E4204B2
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686216018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U8NEVycJyNGomIebYs97j2THCeAYB7AcOoqXlfzwkoY=;
	b=buImPlM27tiKB1Sa8l4Q/qo6J+oIQJsYLBmSo73vza5V6JmT3auEVvLtfuIDpTolgmzYAv
	edyhk+oB/A6q2J6cRsMGZ528fduIyabzSzvWY18kB6OKKCRfLBBdp0OK2vQ05GuGp9mxSR
	EnEERqKeJGcepSVmv8qq4uCAnlgzz7I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-rhopGFt_Mje8OR0SeVCsdA-1; Thu, 08 Jun 2023 05:20:14 -0400
X-MC-Unique: rhopGFt_Mje8OR0SeVCsdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 785613C1351F;
	Thu,  8 Jun 2023 09:20:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 375A3C16044;
	Thu,  8 Jun 2023 09:20:14 +0000 (UTC)
Date: Thu, 8 Jun 2023 10:20:13 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 13/22] dump: Update nbddump to use
 64-bit block status
Message-ID: <20230608092013.GJ7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-14-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230525130108.757242-14-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kCjwrqixKiH.A.kkF.q1ZgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2532
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608092013.GJ7773@redhat.com
Resent-Date: Thu,  8 Jun 2023 09:20:42 +0000 (UTC)

On Thu, May 25, 2023 at 08:00:59AM -0500, Eric Blake wrote:
> Although our use of "base:allocation" doesn't require the use of the
> 64-bit API for flags, we might perform slightly faster for a server
> that does give us 64-bit extent lengths.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  dump/dump.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index b4aebe84..71053277 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -38,7 +38,7 @@
>  #include "version.h"
>  #include "vector.h"
> 
> -DEFINE_VECTOR_TYPE (uint32_vector, uint32_t);
> +DEFINE_VECTOR_TYPE (uint64_vector, uint64_t);
> 
>  static const char *progname;
>  static struct nbd_handle *nbd;
> @@ -262,10 +262,10 @@ catch_signal (int sig)
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
>    if (strcmp (metacontext, LIBNBD_CONTEXT_BASE_ALLOCATION) != 0)
> @@ -273,7 +273,8 @@ extent_callback (void *user_data, const char *metacontext,
> 
>    /* Just append the entries we got to the list. */
>    for (i = 0; i < nr_entries; ++i) {
> -    if (uint32_vector_append (list, entries[i]) == -1) {
> +    if (uint64_vector_append (list, entries[i].length) == -1 ||
> +        uint64_vector_append (list, entries[i].flags) == -1) {
>        perror ("realloc");
>        exit (EXIT_FAILURE);
>      }
> @@ -284,7 +285,7 @@ extent_callback (void *user_data, const char *metacontext,
>  static bool
>  test_all_zeroes (uint64_t offset, size_t count)
>  {
> -  uint32_vector entries = empty_vector;
> +  uint64_vector entries = empty_vector;
>    size_t i;
>    uint64_t count_read;
> 
> @@ -296,22 +297,22 @@ test_all_zeroes (uint64_t offset, size_t count)
>     * false, causing the main code to do a full read.  We could be
>     * smarter and keep asking the server (XXX).
>     */
> -  if (nbd_block_status (nbd, count, offset,
> -                        (nbd_extent_callback) {
> -                          .callback = extent_callback,
> -                          .user_data = &entries },
> -                        0) == -1) {
> +  if (nbd_block_status_64 (nbd, count, offset,
> +                           (nbd_extent64_callback) {
> +                             .callback = extent_callback,
> +                             .user_data = &entries },
> +                           0) == -1) {
>      fprintf (stderr, "%s: %s\n", progname, nbd_get_error ());
>      exit (EXIT_FAILURE);
>    }
> 
>    count_read = 0;
>    for (i = 0; i < entries.len; i += 2) {
> -    uint32_t len = entries.ptr[i];
> -    uint32_t type = entries.ptr[i+1];
> +    uint64_t len = entries.ptr[i];
> +    uint64_t type = entries.ptr[i+1];
> 
>      count_read += len;
> -    if (!(type & 2))            /* not zero */
> +    if (!(type & LIBNBD_STATE_ZERO))            /* not zero */
>        return false;
>    }

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

