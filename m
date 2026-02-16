Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNNpFV3pkmlSzwEAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 16 Feb 2026 10:54:37 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 17656142214
	for <lists+nbd@lfdr.de>; Mon, 16 Feb 2026 10:54:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D8C8A206A7; Mon, 16 Feb 2026 09:54:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 16 09:54:36 2026
Old-Return-Path: <nilay@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FOURLA,GMAIL,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 342DD205BC
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Feb 2026 09:38:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, GMAIL=1, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mnfinyWkHnO9 for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Feb 2026 09:38:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.pphosted.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D78D520596
	for <nbd@other.debian.org>; Mon, 16 Feb 2026 09:38:14 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G5tlvD1899745;
	Mon, 16 Feb 2026 09:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4HrMsi
	96Cy/CaTxkBTb5YFPGwcrGeCvkrINOL9lL5oI=; b=bhQteBupFtfXRzSU+E+ZZz
	lQc8LL+aa3xccbiF8dGfeOPU4ChlHcxXC0rHSca0IOcXEK2Av1yKj7OGLN23TOln
	2XeOVWT45A4R/yhsrr3ZjM8/PHuAqPE3u7AoXt4rEqzOcqD5/szrgrPR5NwQ2PI3
	29LNJonJUNym2robOYEBSjZU8nXW8K7ZzMZI+Iy2roJ209FOyEU36hyB66KjwHwh
	fsR6i4BLlVMX7Knwr0KBF4GEoIiAmDC/Q7NU6Tgq1njrhNdLxJL6GLM6SfUGUAF4
	oR6WAkbzP6LXot8RxSU87BRC72bvrQ2vgfxJ8mAFj1+7qEZ3DzyJ/SaCRJUDZE8Q
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj63xkvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 09:38:07 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61G6KwFI012621;
	Mon, 16 Feb 2026 09:38:06 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cb3crvy5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 09:38:06 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61G9c5bY1639122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Feb 2026 09:38:05 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 901A75805A;
	Mon, 16 Feb 2026 09:38:05 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06D075805C;
	Mon, 16 Feb 2026 09:38:03 +0000 (GMT)
Received: from [9.109.198.164] (unknown [9.109.198.164])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Feb 2026 09:38:02 +0000 (GMT)
Message-ID: <1ea3f9bf-c271-46bf-9310-be489ded05fc@linux.ibm.com>
Date: Mon, 16 Feb 2026 15:08:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.19 kernel
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
References: <aY7ZBfMjVIhe_wh3@shinmob>
Content-Language: en-US
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        "nbd@other.debian.org" <nbd@other.debian.org>
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <aY7ZBfMjVIhe_wh3@shinmob>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 02YJqje8rZh6Zxh_b1ejtbuICIlU1eHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NiBTYWx0ZWRfX9dagytfdB2m7
 bKVX8PF5kCI102GPsiD8smfB0skHb92xNYXGmf5V+TG42gMwGuumR+xBk7adniDnWObPhul965g
 R1+Qr4rF3u0OQFUMgr5a54DoiTFhfeOpcaTPn1nC5yQqQ0EzAXn27BuRSIAb76S4DludVtomvzL
 WwOpVzXbT73mJicNYEBB1wPox3vMiR/3g/TYkQXGOCZvJSBwixJBIENJmZifFmNS5B8Tdxoxn5j
 SfaOmXdWs8+agR9m5jbHeV5BcmlkSMGog9ngEYTZbxQU+VprHkauo5N4FKmFVjBR48CtUB+xiMy
 VTXbAB3/OjY27okuhCS5QjWSLHxV/kKNfHfch9EzUunp583SWtp8p+ZbSJEO1BLgohAwxdgAmOx
 hL5LRql2FCIpm1l8i+k8VkAAxkUSJ/tJkRE9/A7kRa+4WS6pxrimrM1YJhKheyXF85KPT6hyyij
 E57bNAz+jjthMEyVkLw==
X-Proofpoint-GUID: 02YJqje8rZh6Zxh_b1ejtbuICIlU1eHN
X-Authority-Analysis: v=2.4 cv=U+mfzOru c=1 sm=1 tr=0 ts=6992e57f cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=rseCahVfaKpdl2NpX8UA:9 a=QEXdDO2ut3YA:10
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160076
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UiAtKbI6O5J.A.mzAK.clukpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3491
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1ea3f9bf-c271-46bf-9310-be489ded05fc@linux.ibm.com
Resent-Date: Mon, 16 Feb 2026 09:54:36 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chaitanyak@nvidia.com,m:shinichiro.kawasaki@wdc.com,m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nilay@linux.ibm.com,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nilay@linux.ibm.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: 17656142214
X-Rspamd-Action: no action

Hi Chaitanya,

On 2/13/26 1:27 PM, Shinichiro Kawasaki wrote:
> Hi all,
> 
> I ran the latest blktests (git hash: b5b699341102) with the v6.19 kernel. I
> observed 6 failures listed below. Comparing with the previous report with the
> v6.19-rc1 kernel [1], two failures were resolved (nvme/033 and srp) and three
> failures are newly observed (nvme/061, zbd/009 and zbd/013). Recently, kmemleak
> support was introduced to blktests. Two out of the three new failures were
> detected by kmemleak. Your actions to fix the failures will be appreciated as
> always.
> 
> [1] https://lore.kernel.org/linux-block/a078671f-10b3-47e7-acbb-4251c8744523@wdc.com/
> 
> 
> List of failures
> ================
> #1: nvme/005,063 (tcp transport)
> #2: nvme/058 (fc transport)
> #3: nvme/061 (rdma transport, siw driver)(new)(kmemleak)
> #4: nbd/002
> #5: zbd/009 (new)(kmemleak)
> #6: zbd/013 (new)
> 
> 
> Failure description
> ===================
> 
> #1: nvme/005,063 (tcp transport)
> 
>     The test case nvme/005 and 063 fail for tcp transport due to the lockdep
>     WARN related to the three locks q->q_usage_counter, q->elevator_lock and
>     set->srcu. Refer to the nvme/063 failure report for v6.16-rc1 kernel [2].
> 
>     [2] https://lore.kernel.org/linux-block/4fdm37so3o4xricdgfosgmohn63aa7wj3ua4e5vpihoamwg3ui@fq42f5q5t5ic/

For the lockdep failure reported above for nvme/063, it seems we already had
solution but it appears that it's not yet upstreamed, check this:
https://lore.kernel.org/all/20251125061142.18094-1-ckulkarnilinux@gmail.com/

Can you please update and resend the above patch per the last feedback? I think
this should fix the lockdep reported under nvme/063.

Thanks,
--Nilay

