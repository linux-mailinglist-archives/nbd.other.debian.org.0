Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEA4727B89
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 11:35:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 72953204CA; Thu,  8 Jun 2023 09:35:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 09:35:35 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 41624204C5
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 09:35:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mNv3hBVOVNEm for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 09:35:16 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 2DAC320490
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686216911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LIyU5XlSfH9wXSXOw4PKgJOIZLXmiY10iHfP2Gz4rNw=;
	b=JxawJYOu5V87T6sHZmUU9RWpGim0vAsxlgpSgvdBlMeYdCLa9LRVoV/xHoujP61iZvQy8N
	EKkn2now8Hc1RNNfa2PoFzk0mbrQ7nQERBNzRaihm5m7mYCCfQXDxyVIcn3kO1Hr5ipuYp
	4als/GzRDPZ2GLe+a1gotcMmt0CiNTI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-Y_81i744O-mPZfl6-vRBdA-1; Thu, 08 Jun 2023 05:35:07 -0400
X-MC-Unique: Y_81i744O-mPZfl6-vRBdA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D3D31019C87;
	Thu,  8 Jun 2023 09:35:07 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 468722166B25;
	Thu,  8 Jun 2023 09:35:07 +0000 (UTC)
Date: Thu, 8 Jun 2023 10:35:06 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [libnbd PATCH v3 16/22] examples: Update copy-libev to use
 64-bit block status
Message-ID: <20230608093506.GM7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-17-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230525130108.757242-17-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uWXGsCCsssJ.A.CwE.nDagkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2535
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608093506.GM7773@redhat.com
Resent-Date: Thu,  8 Jun 2023 09:35:35 +0000 (UTC)

On Thu, May 25, 2023 at 08:01:02AM -0500, Eric Blake wrote:
> Although our use of "base:allocation" doesn't require the use of the
> 64-bit API for flags, we might perform slightly faster for a server
> that does give us 64-bit extent lengths and honors larger nbd_zero
> lengths.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  examples/copy-libev.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/examples/copy-libev.c b/examples/copy-libev.c
> index 32cb46b3..9346faf7 100644
> --- a/examples/copy-libev.c
> +++ b/examples/copy-libev.c
> @@ -96,7 +96,7 @@ struct request {
>  };
> 
>  struct extent {
> -    uint32_t length;
> +    uint64_t length;
>      bool zero;
>  };
> 
> @@ -184,7 +184,7 @@ get_events (struct connection *c)
> 
>  static int
>  extent_callback (void *user_data, const char *metacontext, uint64_t offset,
> -                 uint32_t *entries, size_t nr_entries, int *error)
> +                 nbd_extent *entries, size_t nr_entries, int *error)
>  {
>      struct request *r = user_data;
> 
> @@ -199,22 +199,21 @@ extent_callback (void *user_data, const char *metacontext, uint64_t offset,
>          return 1;
>      }
> 
> -    /* Libnbd returns uint32_t pair (length, flags) for each extent. */
> -    extents_len = nr_entries / 2;
> +    extents_len = nr_entries;
> 
>      extents = malloc (extents_len * sizeof *extents);
>      if (extents == NULL)
>          FAIL ("Cannot allocated extents: %s", strerror (errno));
> 
>      /* Copy libnbd entries to extents array. */
> -    for (int i = 0, j = 0; i < extents_len; i++, j=i*2) {
> -        extents[i].length = entries[j];
> +    for (int i = 0; i < extents_len; i++) {
> +        extents[i].length = entries[i].length;
> 
>          /* Libnbd exposes both ZERO and HOLE flags. We care only about
>           * ZERO status, meaning we can copy this extent using efficinet
>           * zero method.
>           */
> -        extents[i].zero = (entries[j + 1] & LIBNBD_STATE_ZERO) != 0;
> +        extents[i].zero = (entries[i].flags & LIBNBD_STATE_ZERO) != 0;
>      }
> 
>      DEBUG ("r%zu: received %zu extents for %s",
> @@ -286,10 +285,10 @@ start_extents (struct request *r)
>      DEBUG ("r%zu: start extents offset=%" PRIi64 " count=%zu",
>             r->index, offset, count);
> 
> -    cookie = nbd_aio_block_status (
> +    cookie = nbd_aio_block_status_64 (
>          src.nbd, count, offset,
> -        (nbd_extent_callback) { .callback=extent_callback,
> -                                .user_data=r },
> +        (nbd_extent64_callback) { .callback=extent_callback,
> +                                  .user_data=r },
>          (nbd_completion_callback) { .callback=extents_completed,
>                                      .user_data=r },
>          0);
> @@ -324,7 +323,7 @@ next_extent (struct request *r)
>          limit = MIN (REQUEST_SIZE, size - offset);
> 
>      while (length < limit) {
> -        DEBUG ("e%zu: offset=%" PRIi64 " len=%" PRIu32 " zero=%d",
> +        DEBUG ("e%zu: offset=%" PRIi64 " len=%" PRIu64 " zero=%d",
>                 extents_pos, offset, extents[extents_pos].length, is_zero);
> 
>          /* If this extent is too large, steal some data from it to

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

