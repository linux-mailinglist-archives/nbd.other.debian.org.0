Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C3E562516
	for <lists+nbd@lfdr.de>; Thu, 30 Jun 2022 23:25:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DBE30207F0; Thu, 30 Jun 2022 21:25:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 30 21:25:15 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_LOW,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BA682207B7
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 Jun 2022 21:25:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.266 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.356, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_LOW=-0.7, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id C-5FkpblHGhk for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 Jun 2022 21:25:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 977E920789
	for <nbd@other.debian.org>; Thu, 30 Jun 2022 21:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656624298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7hNufCPhSTd7uu5Zq+ioMP8/PrxgpSvN1ic7iZcWZfE=;
	b=MowBoR4js8IGhgPDTCEzva3qtXMo1aL225g7iqbggIecmVqZQB6E7vwWvsnkp4zSNtmfSd
	yC5Q9QhfxQE4yzG/1riDwaKzUH5Jq7yp8XR9MlVnDFCfzJXztRGd+q4ETrMM+YoDCJ0FZw
	vZNkU4oVyybSZM1JeyfV3Uf26t+k8eE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-uYFQfzBYNPGGaAYEqcjAkw-1; Thu, 30 Jun 2022 17:24:55 -0400
X-MC-Unique: uYFQfzBYNPGGaAYEqcjAkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0562C299E745;
	Thu, 30 Jun 2022 21:24:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA82F40C141F;
	Thu, 30 Jun 2022 21:24:54 +0000 (UTC)
Date: Thu, 30 Jun 2022 22:24:54 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Rohan Khanna <rohan.khanna@thoughtworks.com>
Cc: nbd@other.debian.org
Subject: Re: Requesting some information regarding building nbd-client for
 macos
Message-ID: <20220630212454.GA15839@redhat.com>
References: <CAGx2udZv9_umjYk2Ot_QsNAMQ4sY7OJX=sFrTW=1L5kmb6PgHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGx2udZv9_umjYk2Ot_QsNAMQ4sY7OJX=sFrTW=1L5kmb6PgHA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <E3Shj48w58E.A.2kB.7ShviB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2184
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220630212454.GA15839@redhat.com
Resent-Date: Thu, 30 Jun 2022 21:25:15 +0000 (UTC)

On Thu, Jun 23, 2022 at 06:40:46PM +0200, Rohan Khanna wrote:
> Hello
> I am writing to you requesting for some information as to how may I go about
> building nbd-client for macos. Anything to point me in the right direction
> would be greatly appreciated. 

You'll probably be able to build libnbd for macOS:

https://gitlab.com/nbdkit/libnbd

It would give you various userspace clients, which may be useful
depending on what you're trying to do.

As Wouter has said, porting the kernel client would be very difficult,
essentially a from-scratch rewrite.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

