Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F69A6ED1E5
	for <lists+nbd@lfdr.de>; Mon, 24 Apr 2023 18:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2C8D42079F; Mon, 24 Apr 2023 16:02:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 24 16:02:04 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	LONGWORD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3932B2078D
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Apr 2023 16:01:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.563 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, LONGWORD=2, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id r_tDPNp16Ztw for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Apr 2023 16:01:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 98C2E20677
	for <nbd@other.debian.org>; Mon, 24 Apr 2023 16:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682352100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xgw9w8WSP62id872Le1NU2QB0YLC0/bmvz6n8CSMtf4=;
	b=OdTVnXZBFIe9s/YiH0/m7vTEosHlo2+/nPLvFuvYMzSOAX6Tb0qC4ySaVCtKEVazU9rqjP
	uJbYyEUi8xnFnJ61ixjXPt1mUgEDCzfz2oAbKrpOPyFqCoV9nlAcqiHw90+74bxOGmJ2dE
	zrOmPpUT76imDMVECIZUZVFntTJGq54=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-QzgZWKalM0eQ57Eaoev_AA-1; Mon, 24 Apr 2023 12:01:38 -0400
X-MC-Unique: QzgZWKalM0eQ57Eaoev_AA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 794491C05EB3;
	Mon, 24 Apr 2023 16:01:36 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA3172166B29;
	Mon, 24 Apr 2023 16:01:35 +0000 (UTC)
Date: Mon, 24 Apr 2023 11:01:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, "Richard W.M. Jones" <rjones@redhat.com>, 
	libguestfs@redhat.com, qemu-block@nongnu.org
Subject: Re: [Libguestfs] [PATCH v3 6/6] RFC: spec: Introduce
 NBD_REPLY_TYPE_OFFSET_HOLE_EXT
Message-ID: <brj5kqz4rj63vtl225eivavkqztl35zt4o6zzsrjjk5ydc5usf@7buulacgfqm5>
References: <20230413220241.1396012-1-eblake@redhat.com>
 <20230413220241.1396012-7-eblake@redhat.com>
 <ZD6OJXoQBNJH5p4W@pc220518.home.grep.be>
 <20230418141311.GS7773@redhat.com>
 <626173F3-DE35-4B40-BE48-2633E8EF1E6F@uter.be>
MIME-Version: 1.0
In-Reply-To: <626173F3-DE35-4B40-BE48-2633E8EF1E6F@uter.be>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Xx6uY6z2L3O.A.7vG.8fqRkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2452
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/brj5kqz4rj63vtl225eivavkqztl35zt4o6zzsrjjk5ydc5usf@7buulacgfqm5
Resent-Date: Mon, 24 Apr 2023 16:02:04 +0000 (UTC)

On Wed, Apr 19, 2023 at 07:03:56AM +0200, Wouter Verhelst wrote:
> Apologies; I somehow misread Eric's mail into thinking that the implementation wasn't ready yet. Not sure what happened there.
> 
> If there is an implementation (and clearly there is a need) then I have no objection to merging this on master.

As I just posted elsewhere, I've now merged patches 1-2 mainline,
patches 3-5 to extension-ext-header, and left patch 6 on the mailing
list only.

My next steps are to get qemu and libnbd patches reviewed that comply
with the extension as documented at
https://github.com/NetworkBlockDevice/nbd/blob/extension-ext-header/doc/proto.md.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

