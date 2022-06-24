Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D21455A2C5
	for <lists+nbd@lfdr.de>; Fri, 24 Jun 2022 22:34:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 433C02030E; Fri, 24 Jun 2022 20:34:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 24 20:34:54 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 76B2B20309
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 Jun 2022 20:34:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.037 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.147, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id TLNIiFOPvZss for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 Jun 2022 20:34:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id C33F220307
	for <nbd@other.debian.org>; Fri, 24 Jun 2022 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656102877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wcix+U/ScLx6quPlmOSMe1305BEXvE6NrjLw/oKiuic=;
	b=K3nE13ORgUESrBPRNKBt/7jqGtuhiNjzNA/OcLkQVRForvEdRu3xLk6eVsNvkT5dQBPiUC
	6Ii22L70WtMhPdZrJs+7+/3P67lU0ogOlDcv1omksUyvei9zMtZPZeQOLnFPFMXf9h+P1t
	H2YqgyCR5sOF+Np9vGz1KrVIU1NMpDg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-81BBjXMzMnOF4of6S6xetg-1; Fri, 24 Jun 2022 16:34:36 -0400
X-MC-Unique: 81BBjXMzMnOF4of6S6xetg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F4D53C3FA23;
	Fri, 24 Jun 2022 20:34:36 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67297400F8FD;
	Fri, 24 Jun 2022 20:34:35 +0000 (UTC)
Date: Fri, 24 Jun 2022 15:34:33 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, libguestfs@redhat.com, qemu-block@nongnu.org,
	v.sementsov-og@mail.ru
Subject: Re: [PATCH v3] spec: Clarify BLOCK_STATUS reply details
Message-ID: <20220624203433.zxiyf7pp5dqzcovr@redhat.com>
References: <20220401210807.1515492-1-eblake@redhat.com>
 <20220404104846.GH1127@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220404104846.GH1127@redhat.com>
User-Agent: NeoMutt/20220429-140-c8aaac
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oK6obk8191J.A.LVF.u_htiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2180
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220624203433.zxiyf7pp5dqzcovr@redhat.com
Resent-Date: Fri, 24 Jun 2022 20:34:54 +0000 (UTC)

On Mon, Apr 04, 2022 at 11:48:46AM +0100, Richard W.M. Jones wrote:

Whoops, looks like I let this one sit for a while.

> On Fri, Apr 01, 2022 at 04:08:07PM -0500, Eric Blake wrote:
> > Our docs were inconsistent on whether a NBD_REPLY_TYPE_BLOCK_STATUS
> > reply chunk can exceed the client's requested length, and silent on
> > whether the lengths must be consistent when multiple contexts were
> > negotiated.  Clarify this to match existing practice as implemented in
> > qemu-nbd.  Clean up some nearby grammatical errors while at it.
> > ---
> > 
> > Another round of rewording attempts, based on feedback from Rich on
> > v2.  I went ahead and pushed patch 1 and 2 of the v2 series, as they
> > were less controversial.
> > 
> 
> This seems clearer now, thanks.
> 
> Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

I've pushed this one as commit edaa645

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

