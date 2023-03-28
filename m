Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB06CB397
	for <lists+nbd@lfdr.de>; Tue, 28 Mar 2023 04:09:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 102022056E; Tue, 28 Mar 2023 02:09:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 28 02:09:07 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,WORD_WITHOUT_VOWELS
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D89692055F
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 Mar 2023 02:08:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.563 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id L8NKu3Y9GfzN for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 Mar 2023 02:08:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 4C8372048A
	for <nbd@other.debian.org>; Tue, 28 Mar 2023 02:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679969322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7j1BS/F19S7+qA59gPel8neJ27NKg869/2ymrMUtUVo=;
	b=IbOjOPa1VESAAJdMxY2xoSrrCLDL2RqGtBGZg2MOc5DL3kMqC/fIFFFdMfdwVOnzRrmr4D
	DJiBYO3Mx8F49NePMwnK34T+2Zriuq3NLuDKcrwzcmHvIZdOM++585luN+RKNfSGi2X0qQ
	opdc+7vIgu17o/8GkhrJODR0eo/05y4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-0eJJSjq0OpmmnQwC8IOE_A-1; Mon, 27 Mar 2023 22:08:40 -0400
X-MC-Unique: 0eJJSjq0OpmmnQwC8IOE_A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D3741C05EC7;
	Tue, 28 Mar 2023 02:08:40 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.173])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 495B3492C3E;
	Tue, 28 Mar 2023 02:08:39 +0000 (UTC)
Date: Mon, 27 Mar 2023 21:08:38 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org
Subject: Re: [PATCH 1/4] Refactor request handling
Message-ID: <4ph3rxozanmijvref4l7bq23e4aj4z74hf4znfbfge4qhpci4b@233z3uw565i6>
References: <20230311130705.253855-1-w@uter.be>
 <20230311130705.253855-2-w@uter.be>
 <20230314154454.32a7dbz2jc5rmxms@redhat.com>
 <ZCFw4gF2hsPw8IJ4@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZCFw4gF2hsPw8IJ4@pc220518.home.grep.be>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <e0ij7A8JULB.A.alF.DxkIkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2411
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4ph3rxozanmijvref4l7bq23e4aj4z74hf4znfbfge4qhpci4b@233z3uw565i6
Resent-Date: Tue, 28 Mar 2023 02:09:08 +0000 (UTC)

On Mon, Mar 27, 2023 at 12:33:06PM +0200, Wouter Verhelst wrote:
> > ....
> > > +++ b/nbdsrv.h
> > > @@ -89,6 +89,14 @@ typedef struct {
> > >  	off_t startoff;   /**< starting offset of this file */
> > >  } FILE_INFO;
> > >  
> > > +typedef struct {
> > > +	struct nbd_request *req;
> > > +	char *buf;
> > > +	size_t buflen;
> > > +	size_t current_offset;
> > 
> > Should this be an off_t to begin with, or do we not care about 32-bit platforms?
> 
> current_offset holds how much of the request we have already handled,
> not a file offset. In the case of simple replies (or structured replies
> with DF set), the reply is built into an allocated buffer, and in that
> case current_offset is used in pointer arithmetic (which implies it
> needs to be a size_t, or be at least cast to that).
> 
> It's true that it isn't used in pointer arithmetics in the case of
> structured replies, since there we allocate a fresh buffer every time we
> get into find_read_buf. However, I still want to think of file_read_buf
> as a function returning a, possibly offset, pointer into a buffer even
> in that case, which also implies it should be a size_t rather than an
> off_t.
> 
> Of course, in either case current_offset is *added* to a file offset in
> order to find the point where we should start reading, but that is only
> a secondary usage, not a primary one.
> 
> But perhaps I'm missing something?

Until we have 64-bit extensions implemented (yes, I know I need to
post v3 of my work on that series), it doesn't matter.  And even with
64-bit extensions, you are right that read and write commands bearing
a payload will still tend to be limited by ssize_t or smaller (even
size_t may be too big, depending on which underlying kernel syscalls
we are utilizing), where we aren't likely to overflow an offset in a
structured reply if we never allow a read request >4G in the first
place.  So on re-reading my question and your response, I think you
are okay with size_t for current_offset.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

