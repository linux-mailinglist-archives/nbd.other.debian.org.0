Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E74446BA027
	for <lists+nbd@lfdr.de>; Tue, 14 Mar 2023 20:57:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8793920476; Tue, 14 Mar 2023 19:57:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 14 19:57:30 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4F1D220474
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Mar 2023 19:57:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lMKg-7t_sA05 for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Mar 2023 19:57:11 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 6FF6820473
	for <nbd@other.debian.org>; Tue, 14 Mar 2023 19:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678823826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cwJKLbbt+tCbh3r4moNy9ZfrdrBTTmr8w1YMLV/pQG0=;
	b=P5QtS0zvuUOUU8xoAHtE+pWdbDc3qj2KDIfuTVtep1lQ/wMKdvFNdaTBYalwJ9jRSITI5y
	ldQKpzj4bKTc69cNXj5XNCIXWweNwP/1aVxI1lufmlgf17gOTEuCY9DSSOGm0mg4r5gC3v
	c84Ac1siRX5j9PIG0bQ1OrpM32XhHfc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-kJiNRgUXP2iY_DBKqxDP7A-1; Tue, 14 Mar 2023 15:57:00 -0400
X-MC-Unique: kJiNRgUXP2iY_DBKqxDP7A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D402F802C18;
	Tue, 14 Mar 2023 19:56:59 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0655A400F52;
	Tue, 14 Mar 2023 19:56:58 +0000 (UTC)
Date: Tue, 14 Mar 2023 14:56:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Cc: josef@toxicpanda.com, linux-block@vger.kernel.org, nbd@other.debian.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] block nbd: use req.cookie instead of req.handle
Message-ID: <20230314195657.vpazxest7rvm5frp@redhat.com>
References: <20230310201525.2615385-1-eblake@redhat.com>
 <20230310201525.2615385-4-eblake@redhat.com>
 <CAMRbyyv59L9GiLr5tJvnNdwnBNdNGw+xveG7S63WC9ycOuJYrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRbyyv59L9GiLr5tJvnNdwnBNdNGw+xveG7S63WC9ycOuJYrA@mail.gmail.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fwfhGzUvc3B.A.RSC.qGNEkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2393
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230314195657.vpazxest7rvm5frp@redhat.com
Resent-Date: Tue, 14 Mar 2023 19:57:30 +0000 (UTC)

On Sat, Mar 11, 2023 at 02:22:51PM +0200, Nir Soffer wrote:
> On Fri, Mar 10, 2023 at 10:16 PM Eric Blake <eblake@redhat.com> wrote:
> >
> > A good compiler should not compile this any differently, but it seems
> > nicer to avoid memcpy() when integer assignment will work.
> >
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >  drivers/block/nbd.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 592cfa8b765a..672fb8d1ce67 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -606,7 +606,7 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
> >                 request.len = htonl(size);
> >         }
> >         handle = nbd_cmd_handle(cmd);
> 
> This returns native u64 (likely little endian) but the new interface
> specifies __be64. Should we swap the bytes if needed?

Or document the field as u64 in the .h file.  I'm not sure which is
better, but the mismatch here is definitely why the test robot
complained about new warnings with my v1 patch.  I'm new enough to
kernel development that I will welcome a hint about which way I should
lean in writing v2.

> 
> This will help tools like the wireshark plugin to display the right value
> when checking traces from machines with different endianness. Or help
> the nbd server to show the same *cooike* value in the logs. The value
> is opaque but reasonable code can assume that __be64 can be safely
> parsed as an integer.

The fact that the old code was memcpy()ing a u64 into char[8] over the
wire means that wireshark was already seeing endian-dependant values
in that portion of the struct (a big-endian and little-endian client
that happen to use the same cookie/handle will show up differently).
I don't mind adding byteswapping and using __be64 (instead of direct
assignment and u64) if that's what we want, but I don't think anyone
should be relying on wireshark to have stable output for those bytes,
since they are opaque to the server regardless of endianness.

> 
> Also the same file has references to *handle* like:
> 
> static u64 nbd_cmd_handle(struct nbd_cmd *cmd)
> {
>     struct request *req = blk_mq_rq_from_pdu(cmd);
>     u32 tag = blk_mq_unique_tag(req);
>     u64 cookie = cmd->cmd_cookie;
> 
>     return (cookie << NBD_COOKIE_BITS) | tag;
> }
> 
> static u32 nbd_handle_to_tag(u64 handle)
> {
>     return (u32)handle;
> }
> 
> static u32 nbd_handle_to_cookie(u64 handle)
> {
>     return (u32)(handle >> NBD_COOKIE_BITS);
> }
> 
> So this change is a little bit confusing.
> 
> I think we need to use a term like *nbd_cookie* instead of
> *handle* to make this more clear.

I can additionally rename these helper functions in v2 if that would
be helpful.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

