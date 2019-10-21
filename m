Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CFBDF7D2
	for <lists+nbd@lfdr.de>; Tue, 22 Oct 2019 00:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 12451203B8; Mon, 21 Oct 2019 22:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 21 22:06:09 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C8D72038D
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Oct 2019 21:49:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Kbc9ANOoR_tJ for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Oct 2019 21:49:40 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-1.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
X-Greylist: delayed 309 seconds by postgrey-1.36 at bendel; Mon, 21 Oct 2019 21:49:40 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id 18DB52035B
	for <nbd@other.debian.org>; Mon, 21 Oct 2019 21:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571694574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TGeLaJHLQfa3EPhpXyQnizlrqhS05at+Cg3a1T6joA=;
	b=XRu6/WJCE45UcpXhANVm7hsnWuNJn2+nkslovnHSEV8Y5El3I0kD5NUz/VujaL2u6m0yfm
	BPXIpWlRYiSUpq/PG3EcYBrNzfbqEi1Ie3ssq9tQH6kwWwZ3hJCO/i4SD2PkYX5cFUCubO
	mrUyD8cQtb1P+f8QsWT/lOY4SqHw4ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-zdn-zzpYOuiyX0UgVCM5ug-1; Mon, 21 Oct 2019 17:43:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90009800D41;
	Mon, 21 Oct 2019 21:43:11 +0000 (UTC)
Received: from [10.10.123.171] (ovpn-123-171.rdu2.redhat.com [10.10.123.171])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB3DD60CD0;
	Mon, 21 Oct 2019 21:43:10 +0000 (UTC)
Subject: Re: [PATCH 0/2] fix double completion of timed out commands
To: Josef Bacik <josef@toxicpanda.com>, axboe@kernel.dk,
 nbd@other.debian.org, linux-block@vger.kernel.org, kernel-team@fb.com
References: <20191021195628.19849-1-josef@toxicpanda.com>
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5DAE266E.9020004@redhat.com>
Date: Mon, 21 Oct 2019 16:43:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20191021195628.19849-1-josef@toxicpanda.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: zdn-zzpYOuiyX0UgVCM5ug-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EXjwdl94WgF.A.O1G.RvirdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/721
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5DAE266E.9020004@redhat.com
Resent-Date: Mon, 21 Oct 2019 22:06:09 +0000 (UTC)

On 10/21/2019 02:56 PM, Josef Bacik wrote:
> We noticed a problem where NBD sometimes double completes the same reques=
t when
> things go wrong and we time out the request.  If the other side goes out =
to
> lunch but happens to reply just as we're timing out the requests we can e=
nd up
> with a double completion on the request.
>=20
> We already keep track of the command status, we just need to make sure we
> protect all cases where we set cmd->status with the cmd->lock, which is p=
atch
> #1.  Patch #2 is the fix for the problem, which catches the case where we=
 race
> with the timeout handler and the reply handler.  Thanks,
>=20

Patches look ok and tested ok for me.

Reviewed-by: Mike Christie <mchristi@redhat.com>

