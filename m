Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE1950715
	for <lists+nbd@lfdr.de>; Tue, 13 Aug 2024 16:03:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 469AC205A8; Tue, 13 Aug 2024 14:03:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 13 14:03:56 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7F9E120554
	for <lists-other-nbd@bendel.debian.org>; Tue, 13 Aug 2024 14:03:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jeucOzB3tTlj for <lists-other-nbd@bendel.debian.org>;
	Tue, 13 Aug 2024 14:03:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 45ACF20572
	for <nbd@other.debian.org>; Tue, 13 Aug 2024 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723557816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J6j+LUWomIxEI6R4Yn4ks4Gnz4VF37g4JDVVk/F303Q=;
	b=Ipw84hQcHty9p6656RCSbhr4NDqJuPlTyvnFzXRdhr1a7XbRBTOHF8ivF12Vv3r8fA0sK+
	z6UQbCG9HreROMrvJBfzRx9dlymWy6G1d/CmWxavjHQ5xVZAGN1d69f1FOH28poHhoR3vQ
	0r7WiEmr2s8KhbXjmX0qUTAZc+JfoBw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-AuLerkaWPJqlH4DTx_0cig-1; Tue,
 13 Aug 2024 10:03:32 -0400
X-MC-Unique: AuLerkaWPJqlH4DTx_0cig-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2FC9E18EA818;
	Tue, 13 Aug 2024 14:03:27 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.27])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25707300019C;
	Tue, 13 Aug 2024 14:03:24 +0000 (UTC)
Date: Tue, 13 Aug 2024 09:03:22 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] docs: Tweak location of qemu nbd extensions
Message-ID: <y6zzatumbgufg4kqei7xg2oqyn67x56qic4qxtxiolnrewptwa@4uyfygi5rhme>
References: <20240802133811.2001029-1-eblake@redhat.com>
 <Zq4uK9Z6GX7Ga-qY@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zq4uK9Z6GX7Ga-qY@pc220518.home.grep.be>
User-Agent: NeoMutt/20240425
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2ntZeNkvtJI.A.JlVG.Mf2umB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3139
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/y6zzatumbgufg4kqei7xg2oqyn67x56qic4qxtxiolnrewptwa@4uyfygi5rhme
Resent-Date: Tue, 13 Aug 2024 14:03:56 +0000 (UTC)

On Sat, Aug 03, 2024 at 03:18:35PM GMT, Wouter Verhelst wrote:
> On Fri, Aug 02, 2024 at 08:36:43AM -0500, Eric Blake wrote:
> > Upstream QEMU is moving the location of its NBD docs, as of its commit
> > XXXX[1].  Instead of pointing to the raw git source file, point to the
> > rendered html version built from rST.
> 
> ACK. Please push as soon as that lands.

The qemu patch has landed and the web page is now live, so I pushed
this as commit 29171ec.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

