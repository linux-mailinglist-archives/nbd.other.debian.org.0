Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B93A712EE8
	for <lists+nbd@lfdr.de>; Fri, 26 May 2023 23:26:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 61047206D5; Fri, 26 May 2023 21:26:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 26 21:26:33 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,SARE_MSGID_LONG45,
	SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 84F7E20557
	for <lists-other-nbd@bendel.debian.org>; Fri, 26 May 2023 21:26:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.732 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.161, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ffMH3bo-CVPo for <lists-other-nbd@bendel.debian.org>;
	Fri, 26 May 2023 21:26:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 1B1622052A
	for <nbd@other.debian.org>; Fri, 26 May 2023 21:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685136370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8zM2/rk8/5mOGCzTu12RN5HwBKkzBKTg2eUCtTZPLIQ=;
	b=a/aK4czdJUo6m60qYa2ndlCcOqAfiHeuXHzs2p3z6o65Oe9BHdvSfIZUkHyzufFtj2R+Zo
	wUPbDL5Tq9bdusn39sU1TQkV+lycVTW4K4JvCEWmmVBc4S2JZiVTjeGNLbKmolRAoW1a93
	U/hp6ghOXisn/WBYH45IwV6+p0sPGbc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-X35ChQzfM36VpLQTK-BlYg-1; Fri, 26 May 2023 17:26:07 -0400
X-MC-Unique: X35ChQzfM36VpLQTK-BlYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEF7B3803506;
	Fri, 26 May 2023 21:26:06 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.124])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A7853BB;
	Fri, 26 May 2023 21:26:06 +0000 (UTC)
Date: Fri, 26 May 2023 16:26:04 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 02/22] internal: Refactor layout
 of replies in sbuf
Message-ID: <5dmg2bdgkse5loxfkqisvt3jwjjzvlrf4zzdqaj5mxsrikznwa@6jhsdkwdqum2>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-3-eblake@redhat.com>
 <1fa92626-e5ac-5e95-f697-88804020ad46@redhat.com>
 <87df235a-0e5f-8c36-bff1-15910bc3947c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87df235a-0e5f-8c36-bff1-15910bc3947c@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <255_ob7STxK.A.tYE.JQSckB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2506
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5dmg2bdgkse5loxfkqisvt3jwjjzvlrf4zzdqaj5mxsrikznwa@6jhsdkwdqum2
Resent-Date: Fri, 26 May 2023 21:26:33 +0000 (UTC)

On Fri, May 26, 2023 at 06:09:00PM +0200, Laszlo Ersek wrote:
> On 5/26/23 17:53, Laszlo Ersek wrote:
> 
> > Optimally, the simple reply and the structured reply should look like
> > this:
> > 
> >   struct nbd_reply_header {
> >     uint32_t magic;
> >     union {
> >       struct {
> >         uint32_t error;
> >         uint64_t handle;
> >       } simple;
> >       struct {
> >         uint16_t flags;
> >         uint16_t type;
> >         uint64_t handle;
> >         uint32_t length;
> >       } structured;
> >     } magic_specific;
> >   };
> > 
> > and we should have separate automaton states for reading
> > "magic_specific.simple" and "magic_specific.structured".
> > 
> > In REPLY.START, we should only read "magic".
> > 
> > We should have a sepate state called REPLY.SIMPLE_REPLY.START, for
> > reading "magic_specific.simple".
> > 
> > In REPLY.STRUCTURED_REPLY.START, we should point h->rbuf at
> > "magic_specific.structured", and read "sizeof magic_specific.structured"
> > bytes.
> 
> This (pre-patch) part:
> 
>   /* NB: This works for both simple and structured replies because the
>    * handle (our cookie) is stored at the same offset.
>    */
>   [...]
>   cookie = be64toh (h->sbuf.simple_reply.handle);
> 
> is disconcerting as well. I think it's well-defined C, but a hack
> nonetheless.
> 
> IMO, unions are justified for two purposes:
> 
> - deliberately reinterpreting one object representation as another
> 
> - saving space, when at most one of N objects is expected to exist at
> any given time.
> 
> Both of those uses follow from intentional elements of a design. But the
> fact that "handle" is at the same offset in both "simple" and
> "structured" is totally arbitrary. IMO this is a hack.

It is not completely arbitrary: when structured replies were added to
the NBD spec, the choice of having handle at the same offset was
intentional.  Similarly, extended replies have it at the same offset
as well.  But a STATIC_ASSERT proving that would go a long way to
proving our intent, more than just a comment in the code.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

