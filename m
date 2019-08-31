Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D17A4165
	for <lists+nbd@lfdr.de>; Sat, 31 Aug 2019 02:42:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3192B204D8; Sat, 31 Aug 2019 00:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 31 00:42:09 2019
Old-Return-Path: <taylor4869@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 662C020255
	for <lists-other-nbd@bendel.debian.org>; Sat, 31 Aug 2019 00:24:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.949 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CtARv0At7VTj for <lists-other-nbd@bendel.debian.org>;
	Sat, 31 Aug 2019 00:24:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 52B0B2021C
	for <nbd@other.debian.org>; Sat, 31 Aug 2019 00:23:59 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id u13so6565500lfm.9
        for <nbd@other.debian.org>; Fri, 30 Aug 2019 17:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=QnPe0NDPgZ43Zsop+49H9KdmJv0qUTIgohe/RIo8y8Y=;
        b=hsfJ+RcFsf9/xlO+fJH2vc/kq5KBFL7xHXgkobgrdSrgr07CaPo47qasupRBCGcuo9
         rMoq02ID5mM8yv0n1xV/622NEF88gq1Remcl0VkqNlLCREaRTE3VIUK9okynfB92AyZA
         4kiIDANm3JZFF3Q3B3hBpHds6x/RuyzuYsHHhcButJKWBJIW/jsv56+SJGzzbwWBotl+
         H1GmjIUXMpMdR3zH1vVXRqtW01P0Qe1DG/Ee5shcaomqbzzl4/HicVXPW8d0s5urKHIz
         FmwggJ5IDZq5JGcDFCXIcHU+mTgmUv2YNKdxBO6PIjlgufeF41wYZyyqqZDqktcndEwx
         fqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QnPe0NDPgZ43Zsop+49H9KdmJv0qUTIgohe/RIo8y8Y=;
        b=dpjqdpq5oe0oKs6pBcOeqAKEnzZZVJkatkCPuqpvGY8rF9V6/faIvahldGWKrv3p7F
         qgLTknxVqP25ey5setyrnTxU1Yshpyw3FlP+ptNIbf6xKsTqklXU3BBSQuIxmhGCUVOi
         LaBx4Rs237RFKsm2579/EpCNGXvYCm45wze6xgqtiuBc36ap82SPRWc/9quzAvwNziK5
         vbdW2ZJiXIUeNlQJfuL/gumyKvf5No/MYoAqRvetFDgb3v3Au3a5rj1V0LIRNlSugAdr
         UqpuQLIaczWWCNTLzU0qdnhPftp8jIsUouINzGa0GqbQJoN+x2K3T0ddSMR42ECaGUsU
         pmhQ==
X-Gm-Message-State: APjAAAVwN/z9lokiHtW56QE8PCB1NDxZwavZknmppaUjtPp+KMUSHzAB
	dgPsxncLJd/UnYfFvFPx4MuvMAsMIDIiCL5IoyVGVI0r
X-Google-Smtp-Source: APXvYqynMB8dO5wZwynZ0ThWVvgWBCP5JEL42zTKpXbj3kkuHfFR3VM6JOvosWFjsN8SCK2HUpiRulm+l8N6IRoffmw=
X-Received: by 2002:a19:2d54:: with SMTP id t20mr5172169lft.84.1567211036129;
 Fri, 30 Aug 2019 17:23:56 -0700 (PDT)
MIME-Version: 1.0
From: Taylor Yang <taylor4869@gmail.com>
Date: Fri, 30 Aug 2019 17:23:44 -0700
Message-ID: <CAKiK_mD-sk_RqO_gtCL0-aeayZZ1miZ1LvBNGDhRB6ft+810bw@mail.gmail.com>
Subject: Question about IO workload via NBD
To: nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <n0b2JfkDykO.A.-rH.hJcadB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/672
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAKiK_mD-sk_RqO_gtCL0-aeayZZ1miZ1LvBNGDhRB6ft+810bw@mail.gmail.com
Resent-Date: Sat, 31 Aug 2019 00:42:09 +0000 (UTC)

Hi,

I worked on driving IO workload using FIO to a device via NBD. There
seems to be some delay on the IO being shown on the original device
after the FIO workload completed on the NBD. Is there a delay on how
long the IO would be acknowledged on the original device? Is there any
logging information I could get to troubleshoot this issue?

Thank you so much for your help in advance.
Best wishes,
Taylor

