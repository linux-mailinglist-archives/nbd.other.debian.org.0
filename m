Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1A727B0F
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 11:20:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 88CD7204C6; Thu,  8 Jun 2023 09:20:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 09:20:06 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 99D8D204B2
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 09:19:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id c1P-pYzvBgot for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 09:19:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 417CC204C1
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686215984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3TwVva/QRRQeAQ08vvYIRDZdaUJt5oFfvbVqr0eSIqo=;
	b=QGD4es5+YHhm3cnXALTw0eqtW1JrZ/p02X5UUPkvG5nEBWRtc+Ox/uzyiZYk5yE9toS/ZJ
	wYcoevRnsHD7dNvlmbuTQ3dVYTzih/MyAZ5SDoq3RrauWWLBxnE/s6owP6kKODBIIpdkq8
	Xl37zklSQGSH/zaWiPxH5ctdVHc9Xdg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-wAJNmIoOMB6FXFiBnP3odQ-1; Thu, 08 Jun 2023 05:19:41 -0400
X-MC-Unique: wAJNmIoOMB6FXFiBnP3odQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D873811E85;
	Thu,  8 Jun 2023 09:19:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB7F940D1B66;
	Thu,  8 Jun 2023 09:19:40 +0000 (UTC)
Date: Thu, 8 Jun 2023 10:19:40 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 12/22] copy: Update nbdcopy to use
 64-bit block status
Message-ID: <20230608091940.GI7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-13-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230525130108.757242-13-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bXYvwXUPG8G.A.kaF.G1ZgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2531
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608091940.GI7773@redhat.com
Resent-Date: Thu,  8 Jun 2023 09:20:06 +0000 (UTC)

On Thu, May 25, 2023 at 08:00:58AM -0500, Eric Blake wrote:
> Although our use of "base:allocation" doesn't require the use of the
> 64-bit API for flags, we might perform slightly faster for a server
> that does give us 64-bit extent lengths and honors larger nbd_zero
> lengths.

I think this change may turn out to be more significant than you have
describe here.

Consider copying from a remote, very large, mostly blank NBD source,
and also that our block status querying is synchronous.  The old
nbdcopy might end up doing lots of serialized round trips over 4GB
segments of the source to discover that it is sparse.  With this
change as I understand it, those would be coalesced into a single RTT.

(Similarly when zeroing on the output side, but to a lesser extent
because those requests can be issued in parallel.)

> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  copy/nbd-ops.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/copy/nbd-ops.c b/copy/nbd-ops.c
> index f3b3bed3..71ee0a3b 100644
> --- a/copy/nbd-ops.c
> +++ b/copy/nbd-ops.c
> @@ -428,7 +428,7 @@ nbd_ops_asynch_notify_write (struct rw *rw, size_t index)
>   * request for extents in a single round trip.
>   */
>  static int add_extent (void *vp, const char *metacontext,
> -                       uint64_t offset, uint32_t *entries, size_t nr_entries,
> +                       uint64_t offset, nbd_extent *entries, size_t nr_entries,
>                         int *error);
> 
>  static void
> @@ -449,11 +449,11 @@ nbd_ops_get_extents (struct rw *rw, size_t index,
>      size_t i;
> 
>      exts.len = 0;
> -    if (nbd_block_status (nbd, count, offset,
> -                          (nbd_extent_callback) {
> -                            .user_data = &exts,
> -                            .callback = add_extent
> -                          }, 0) == -1) {
> +    if (nbd_block_status_64 (nbd, count, offset,
> +                             (nbd_extent64_callback) {
> +                               .user_data = &exts,
> +                               .callback = add_extent
> +                             }, 0) == -1) {
>        /* XXX We could call default_get_extents, but unclear if it's
>         * the right thing to do if the server is returning errors.
>         */
> @@ -496,7 +496,7 @@ nbd_ops_get_extents (struct rw *rw, size_t index,
> 
>  static int
>  add_extent (void *vp, const char *metacontext,
> -            uint64_t offset, uint32_t *entries, size_t nr_entries,
> +            uint64_t offset, nbd_extent *entries, size_t nr_entries,
>              int *error)
>  {
>    extent_list *ret = vp;
> @@ -505,25 +505,25 @@ add_extent (void *vp, const char *metacontext,
>    if (strcmp (metacontext, "base:allocation") != 0 || *error)
>      return 0;
> 
> -  for (i = 0; i < nr_entries; i += 2) {
> +  for (i = 0; i < nr_entries; i++) {
>      struct extent e;
> 
>      e.offset = offset;
> -    e.length = entries[i];
> +    e.length = entries[i].length;
> 
>      /* Note we deliberately don't care about the HOLE flag.  There is
>       * no need to read extent that reads as zeroes.  We will convert
>       * to it to a hole or allocated extents based on the command line
>       * arguments.
>       */
> -    e.zero = (entries[i+1] & LIBNBD_STATE_ZERO) != 0;
> +    e.zero = (entries[i].flags & LIBNBD_STATE_ZERO) != 0;
> 
>      if (extent_list_append (ret, e) == -1) {
>        perror ("realloc");
>        exit (EXIT_FAILURE);
>      }
> 
> -    offset += entries[i];
> +    offset += entries[i].length;
>    }
> 
>    return 0;
> -- 
> 2.40.1

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

